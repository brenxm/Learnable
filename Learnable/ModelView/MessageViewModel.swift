//
//  MessageModelView.swift
//  Learnable
//
//  Created by Bryan Mina on 7/7/24.
//

import Foundation

class MessageViewModel: SingletonViewModel, ObservableObject {
    static var shared = MessageViewModel()
    
    @Published var chatData: [ChatMessage] = [
        ChatMessage(sender: Sender.teacher, message: "Hi there, how may I assist you today?"),
        
        ChatMessage(sender: Sender.user, message: "Nothing muchc, whats up"),
        
        ChatMessage(sender: Sender.teacher, message: "Just chilling, whats up bro?"),
        
        ChatMessage(sender: Sender.user, message: "I want to call colleen and meet up so we can f you know")
    ]
    
    func addChatMessage(message: ChatMessage) {
        self.chatData.append(message)
    }
    
}
