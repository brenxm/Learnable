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
    @StateObject var messageViewModel = MessageViewModel.shared
    @StateObject var messageGroup = GroupMessages()
    var prompt: Prompt { Prompt(.quickStudy, messages: messageGroup) }
    var title: String
    

    var body: some View {
        VStack (alignment: .leading, spacing: 0) {
            PageTitle(title)

            PageDivider()
            
            List ( messageGroup.chatMessages, id: \.self) {data in
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
            }
            .listStyle(.plain)
    
            
            // Chat box here
            ChatBoxFieldView(messageGroup: messageGroup, promptRules: prompt)
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
        }
    }
    
    func senderHorizontalAlignment(sender: Sender) -> Alignment {
        switch sender {
        case .teacher:
            return .leading
        case .user:
            return .trailing
        }
    }
    
    func senderToTitle(sender: Sender) -> String {
        switch sender {
        case .teacher:
            return "Teacher"
        case .user:
            return "Bryan" // To be refactored, get user name from the personal info data
        }
    }
}

//** Component for MessageView **//
struct ChatBoxFieldView: View {
    @StateObject var messageViewModel = MessageViewModel.shared
    var messageGroup: GroupMessages
    var promptRules: Prompt
    
    @State var text: String = ""
    
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
                            let newChat = ChatMessage(sender: .user, message: text)
                            text = ""
                            messageGroup.addChatMessage(message: newChat)
                            fetchChatCompletion(prompt: promptRules.promptMessage) {
                                    if let response = $0 {
                                        DispatchQueue.main.async {
                                            let resObj = responseToObj(response: response)
                                            messageGroup.addChatMessage(message: ChatMessage(sender: .teacher, message: resObj.message))}
                                    } else {
                                        print("error occured")
                                    }
                            }
                        } else {
                            print("nothing was sent")
                        }
                    }
            }
        }
        .padding(10)
    }
}



enum Sender {
    case teacher
    case user
}

struct ResponseFormat: Codable {
    var sender: String
    var message: String
}

func responseToObj(response: String) -> QuickStudyFormat {
    let decoder = JSONDecoder()
    
    if let jsonData = response.data(using: .utf8) {
        do {
            let chatMessage = try decoder.decode(QuickStudyFormat.self, from: jsonData)
            print("succefully decoded \(chatMessage)")
            return chatMessage
        } catch {
            print("Error decoding response")
        }
    }
    
    return QuickStudyFormat(title: "Error", message: "Error")
}
