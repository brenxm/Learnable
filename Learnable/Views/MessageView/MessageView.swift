//
//  MessageView.swift
//  Learnable
//
//  Created by Bryan Mina on 7/6/24.
//

import Foundation
import SwiftUI


struct MessageView: View {
    @StateObject var messageViewModel = MessageViewModel.shared
    @Environment(\.dismiss) var dismiss
    var title: String
    
    
    var body: some View {
        VStack (alignment: .leading, spacing: 0) {
            PageTitle(title)

            PageDivider()
            
            List(messageViewModel.chatData, id: \.self) {data in
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
            ChatBoxFieldView()
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
                            messageViewModel.addChatMessage(message: newChat)
                        } else {
                            print("nothing was sent")
                        }
                        
                    }
            }
        }
        .padding(10)
    }
}


struct ChatMessage: Hashable {
    var sender: Sender
    var message: String
}

enum Sender {
    case teacher
    case user
}
