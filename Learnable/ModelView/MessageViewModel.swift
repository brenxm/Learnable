//
//  MessageModelView.swift
//  Learnable
//
//  Created by Bryan Mina on 7/7/24.
//

import Foundation

class MessageViewModel: SingletonViewModel, ObservableObject {
    static var shared = MessageViewModel()
    
    @Published var chatMessages: [MessageGroup] = []
}

class MessageGroup: ObservableObject {
    @Published var chatMessages: [ChatMessage] = []
    
    func addChatMessage(message: ChatMessage) {
        self.chatMessages.append(message)
    }
    
    func clearMessages() {
        self.chatMessages.removeAll()
    }
}

struct ChatMessage: Hashable {
    var sender: Sender
    var message: String
}
