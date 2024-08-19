import Foundation

struct OpenAIChatMessage: Codable {
    let role: String
    let content: String
}

struct OpenAIChatRequest: Codable {
    let model: String
    let messages: [OpenAIChatMessage]
    let response_format: OpenAIResponseFormat
}

struct OpenAIChatResponse: Codable {
    struct Choice: Codable {
        let message: OpenAIChatMessage
    }
    let choices: [Choice]
}

struct OpenAIResponseFormat: Codable {
    let type: String
}

func fetchChatCompletion(prompt: String, completion: @escaping (String?) -> Void) {
    // OpenAI API key
    let apiKey = Keys.shared.key
    
    // Endpoint URL for OpenAI Chat API
    let url = URL(string: "https://api.openai.com/v1/chat/completions")!
    
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
    
    // Request body
    let chatRequest = OpenAIChatRequest(
        model: "gpt-4o",
        messages: [
            OpenAIChatMessage(role: "user", content: prompt)
        ],
        response_format: OpenAIResponseFormat(type: "json_object")
    )
    
    guard let httpBody = try? JSONEncoder().encode(chatRequest) else {
        print("Failed to encode request body")
        completion(nil)
        return
    }
    
    request.httpBody = httpBody
    
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        guard let data = data, error == nil else {
            print("Error: \(error?.localizedDescription ?? "Unknown error")")
            completion(nil)
            return
        }
        
        
        do {
            let response = try JSONDecoder().decode(OpenAIChatResponse.self, from: data)
            
            
            let result = response.choices.first?.message.content
            completion(result)
        } catch {
            
            // attempt to decode data in string
            let readData = String(data: data, encoding: .utf8)
            print(readData ?? "")
            print("Failed to decode response: \(error)")
            completion(nil)
        }
    }
    
    task.resume()
}

func formatResponse<T>(format: T, message: String) -> T? where T: Decodable {
    
   // print("received string: \(message)")
    let decoder = JSONDecoder()
    
    do {
        let encodedData = message.data(using: .utf8)
        
        
        let formattedObj = try decoder.decode(type(of: format), from: encodedData!)
        
        return formattedObj
        
    } catch {
        print("Error encoding or decoding message: \(error)")
    }
    
    return nil
}

