//
//  MessageView.swift
//  Learnable
//
//  Created by Bryan Mina on 7/6/24.
//

import Foundation
import SwiftUI


struct MessageView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var messageGroup = MessageGroup()
    var title: String
    var promptRule: PromptRules
    
    var body: some View {
        VStack (alignment: .leading, spacing: 0) {
            PageTitle(title)

            PageDivider()
            
            List ( messageGroup.chatMessages, id: \.self) {data in
                
                // Display of chat bubbles
                if (data.sender != .curriculum) {
                    VStack (alignment: senderAlignment(sender: data.sender)){
                        Text(senderToTitle(sender: data.sender))
                            .frame(maxWidth: .infinity, alignment: senderHorizontalAlignment(sender: data.sender))
                            .foregroundStyle(Color(white: 0.3))
                            .font(.system(size: 13))
                        
                        Text(data.message)
                            .frame(maxWidth: 300, alignment: senderHorizontalAlignment(sender: data.sender))
                            .font(.system(size: 15))
                    }
                    .listRowSeparator(.hidden)
                    .padding(.bottom, 3) // Gap for the list
                } else { // Manage curriculum
                    
                    let curriculumFormat = formatResponse(format: CurriculumFormat(), message: data.message)
                    
                    if let curriculum = curriculumFormat {
                        
                        VStack {
                            Text(curriculum.title)
                            
                            VStack (alignment: .leading, spacing: 10){
                                ForEach (curriculum.topics, id: \.self) { data in
                                    
                                    VStack(alignment: .leading, spacing: 3) {
                                        Text(data.title)
                                            .font(.system(size: 15))
                                            .padding(.leading, 6)
                                    
                                        ForEach (data.subTopics, id: \.self) { subTopic in
                                            Text(subTopic)
                                                .font(.system(size: 11))
                                                .padding(.leading, 15)
                                                .listSectionSpacing(4)
                                        }
                                    }
                                }
                                
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(5)
                        .background(Color(white: 0.95))
                        .cornerRadius(5)
                    }
                }
            }
            .listStyle(.plain)
    
            ChatBoxFieldView {
                // Handle User prompt appending to chatMessages
                let newChatMessage = ChatMessage(sender: .user, message: $0)
                messageGroup.addChatMessage(message: newChatMessage)
                let newPrompt = prompt(promptRules: promptRule, messages: messageGroup.chatMessages)
                
                
                // Handle gpt response
                fetchChatCompletion(prompt: newPrompt) {
                
                    // add response of openAi to chat messages
                    let responseFormat = promptRule.responseFormat
                    
                    let formattedResult = formatResponse(format: responseFormat, message: $0!)
                    
                    
                    let curriculumFormated = formatResponse(format: CurricuLumProposalFormat(), message: $0!)
                    
                    let aiResponse = ChatMessage(sender: .teacher, message: formattedResult!.message)
                    
                    // Appending 'message' of gpt response to chatmessages
                    DispatchQueue.main.async {
                        messageGroup.addChatMessage(message: aiResponse)
                    }
                    
                    if let curriculum = curriculumFormated?.curriculum {
                        //print(curriculum)
                        
                        let encoder = JSONEncoder()
                        
                        do {
                            let curriculumString = try String(data: encoder.encode(curriculum), encoding: .utf8)
                            
                            let newMessage = ChatMessage(sender: .curriculum, message: curriculumString!)
                            
                            DispatchQueue.main.async {
                                messageGroup.addChatMessage(message: newMessage)
                            }
                            
                        } catch {
                            print("Error occur during attempt of encoding")
                        }
                    }
                    
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    dismiss()
                }) {
                   PageDismissButton()
                }
            }
        }
        .onDisappear ( perform: {
                messageGroup.clearMessages()
            }
        )
    }
    
    func senderAlignment(sender: Sender) -> HorizontalAlignment {
        switch sender {
            
        case .teacher:
            return .leading
        case .user:
            return .trailing
        case .curriculum:
            return .center
        }
    }
    
    func senderHorizontalAlignment(sender: Sender) -> Alignment {
        switch sender {
        case .teacher:
            return .leading
        case .user:
            return .trailing
            
        case .curriculum:
            return .center
        }
    }
    
    func senderToTitle(sender: Sender) -> String {
        switch sender {
        case .teacher:
            return "Teacher"
        case .user:
            return "Bryan" // To be refactored, get user name from the personal info data
        case .curriculum:
            return ""
        }
    }
    
    func prompt(promptRules: PromptRules, messages: [ChatMessage]) -> String {
        // Structures the prompt message to be submitted to openai api
        // It takes the prompt rules and the chatmessages to single String
        let chatMessages = messages.map { "\($0.sender == .teacher ? "Teacher" : "User"): \($0.message)" }
        let chatMessagesToString = chatMessages.joined(separator: "\n")
        
        return "\(promptRules.systemAndResponseFormat). And this is the chat history: \(chatMessagesToString)"
    }
    
    func formatResponse<T>(format: T, message: String) -> T? where T: Decodable {
        
        print("received string: \(message)")
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
}

//** Component for MessageView **//
struct ChatBoxFieldView: View {
    
    var submitFn: (String) -> Void
    
    @State var text: String = ""
    
    init(_ submitFn: @escaping (String) -> Void) {
        self.submitFn = submitFn
    }
    
    var body: some View {
        VStack {
            // nav bar
            HStack{
                
            }
            
            HStack {
                VStack {
                    TextEditor(text: $text)
                        .frame(height: 80)
                        .overlay {
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.gray, lineWidth: 0.5)
                        }
                }
                
                Image("send.light")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .onTapGesture {
                        if !text.isEmpty {
                            
                            submitFn(text)
                            text = ""
                            
                        } else {
                            print("nothing was sent")
                        }
                    }
            }
        }
        .padding(10)
    }
}



