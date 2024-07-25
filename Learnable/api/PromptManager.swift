//
//  PromptManager.swift
//  Learnable
//
//  Created by Bryan Mina on 7/24/24.
//

import Foundation


// Prompt types
enum PromptTypes {
    case quickStudy
    case learning
}

class Prompt {
    var messageGroup: GroupMessages
    var value: PromptEntity
    
    var promptMessage: String {
        "\(value.prompt), \(messagesToString())"
    }
    
    init(_ type: PromptTypes, messages: GroupMessages){
        switch (type){
            
        case .quickStudy:
            value = QuickStudyPrompt.shared
        case .learning:
            value = QuickStudyPrompt.shared
        }
        self.messageGroup = messages
    }
    
    func messagesToString() -> String {
        var arrOfMessages: [String] = []
        for message in messageGroup.chatMessages {
            var sender: String = ""
            
            switch( message.sender ) {
            case .teacher:
                sender = "Teacher"
            case .user:
                sender = "User"
            }
            
            arrOfMessages.append("\(sender): \(message.message)")
        }
        return arrOfMessages.joined(separator: ",\n")
    }
}

protocol PromptEntity {
    var systemPrompt: String { get }
    var responseFormat: AnyJsonFormat? { get }
    var prompt: String { get }
}

protocol JsonFormat {
    func propertiesInString () -> String
}

struct AnyJsonFormat {
    var format: JsonFormat
    
    
    init<T>(_ format: T){
        self.format = format as! any JsonFormat
    }
}
