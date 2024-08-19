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

enum Sender {
    case teacher
    case user
    case curriculum
}

protocol ChatMessageProtocol: Hashable {
    var sender: Sender { get }
    var message: String { get }
}

class MessageGroup: ObservableObject {
    @Published var chatMessages: [ChatMessage] = []
    
    func addChatMessage(message: ChatMessage) {
        self.chatMessages.append(message)
    }
    
    func removeCurriculum() {
        let i = self.chatMessages.firstIndex(where: {$0.sender == .curriculum})
        self.chatMessages.remove(at: i!)
    }
    
    func clearMessages() {
        self.chatMessages.removeAll()
    }
}

struct ChatMessage: ChatMessageProtocol {
    var sender: Sender
    var message: String
   
}
