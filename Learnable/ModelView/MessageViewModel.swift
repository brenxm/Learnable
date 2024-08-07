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
    @Published var chatMessages: [ChatMessage] = [
        ChatMessage(sender: .curriculum, message: """
{"title":"Basic Elementary Algebra","topics":[{"subTopics":["Definition and History","Basic Terminology","Symbols and Notations"],"title":"Introduction to Algebra"},{"title":"Numbers and Operations","subTopics":["Natural Numbers","Whole Numbers","Integers","Fraction and Decimal Numbers","Order of Operations (PEMDAS)"]},{"title":"Basic Equations","subTopics":["Understanding Equations","Balancing Equations","Solving Simple Linear Equations","Word Problems Involving Equations"]},{"subTopics":["What are Variables?","Using Variables in Equations","Substitution Method"],"title":"Understanding Variables"},{"subTopics":["Cartesian Plane","Plotting Points","Basic Linear Graphs"],"title":"Introduction to Graphs"}]}
"""
                   )
    ]
    
    func addChatMessage(message: ChatMessage) {
        self.chatMessages.append(message)
    }
    
    func clearMessages() {
        self.chatMessages.removeAll()
    }
}

struct ChatMessage: ChatMessageProtocol {
    var sender: Sender
    var message: String
   
}
