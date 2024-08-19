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
    @State var isLoading: Bool = false
    @State var completedGeneration: Bool = false
    @State var generatedLectureObject: GeneratedLectureObject = GeneratedLectureObject(subjectTitle: "", blurb: "", topics: [])
    
    // Manage for 'New Subject'
    @State var generatedCurriculum: CurricuLumProposalFormat? = nil
    
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
                        
                        VStack (spacing: 5) { // modifies space between Curriculum container and button container at bottom
                            VStack (spacing: 10){ // modifies space between title and topics in the curriculum container
                                Text(curriculum.title)
                                    .foregroundStyle(Color(white: 1))
                                
                                VStack (alignment: .leading, spacing: 10){
                                    ForEach (curriculum.topics, id: \.self) { data in
                                        
                                        VStack(alignment: .leading, spacing: 3) {
                                            Text(data.title)
                                                .font(.system(size: 13))
                                                .foregroundStyle(Color(white: 0.9))
                                                .padding(.leading, 6)
                                            
                                            ForEach (data.subTopics, id: \.self) { subTopic in
                                                Text(subTopic)
                                                    .font(.system(size: 10))
                                                    .foregroundStyle(Color(white: 0.8))
                                                    .padding(.leading, 15)
                                                    .listSectionSpacing(4)
                                            }
                                        }
                                    }
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(5)
                            .padding(.vertical, 10)
                            .background(Color(white: 0.1))
                            .cornerRadius(5)
                            .listRowSeparator(.hidden)
                            
                            HStack {
                                CurriculumButton(label: "Generate", systemIcon: "sparkles") {
                                    print("clicked generate button")
                                    
                                    if let curriculum = generatedCurriculum {
                                        print(type(of: curriculum))
                                        let subjectCurriculum = curriculum.curriculum
                                        Task {
                                            
                                            isLoading = true
                                            await GenerateSubject(subjectCurriculum) {
                                                
                                                completedGeneration = true // Binding variable - toggle will change view to loading
                                                generatedLectureObject = $0
                                                
                                                print("called cb function")
                                            }
                                        }
                                    }
                                    
                                }
                                CurriculumButton(label: "Edit", systemIcon: "pencil.line") {
                                    messageGroup.removeCurriculum()
                                }
                                
                            }
                            .listRowSeparator(.hidden)
                            .frame(maxWidth: .infinity, alignment: .center)
                            
                        }
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
                        
                        if generatedCurriculum != nil { // Removes the outdate curriculum View in chat view
                            DispatchQueue.main.async {
                                messageGroup.removeCurriculum()                                
                            }
                            print("successfully replaced")
                        }
                        
                        generatedCurriculum = curriculumFormated
                        
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
            
            NavigationLink(destination: GenerateSubjectLoadingView(subjectGenerationCompleted: $completedGeneration, generatedLecture: $generatedLectureObject), isActive: $isLoading) {
                EmptyView()
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
                        .frame(height: 30)
                        .overlay {
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.gray, lineWidth: 0.5)
                        }
                }
                
                Image("send.light")
                    .resizable()
                    .frame(width: 20, height: 20)
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

// Curriculum Buttons
struct CurriculumButton: View {
    
    var label: String
    var systemIcon: String
    var foregroundColor: Color = Color.white
    var onTapFunction: () -> Void
    
    var body: some View {
        HStack {
            
            Image(systemName: systemIcon)
                .resizable()
                .foregroundColor(foregroundColor)
                .frame(width: 15, height: 15)
            
            Text(label)
                .foregroundStyle(foregroundColor)
                .font(.system(size: 15))
        }
        .frame(maxWidth: 100)
        .padding(5)
        .background(Color(white: 0.3))
        .cornerRadius(5)
        .onTapGesture {
            onTapFunction()
        }
    }
}
