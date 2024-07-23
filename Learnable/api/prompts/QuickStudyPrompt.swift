//
//  QuickStudyPrompt.swift
//  Learnable
//
//  Created by Bryan Mina on 6/16/24.
//

import Foundation

struct QuickStudyPrompt {
    var system: String =
    "You are an assistant but mainly a teacher of any lesson. Right now you are accepting quick lessons and not a full lecture. So whatever is asked, you only respond with the appropirate answer to the question. "
    var formatDeclaration: String = "You only respond with json and must follow this schematic: /ntitle: String (title of this quick study)/nmessage: String (Your response)"
    
    var chatHistory: String = "/nThis is the chat history so far:\nTeachah: What do you want to learn? "
    
    var prompt: String { self.system + self.formatDeclaration + self.chatHistory }
}

// Datacore will store for quickStudyPrompt
//      Title: String
//      Conversation: [chatMessagesInstance]
//      GeneratedQuestions: [questionsInstance]
//      status: Enum( archive, active )
//      lastAccessDate: Date


// Schematic for openAIResponse
//      Title: String
//      Message: String
//

// Prompt:
// System:
//    "You are an assistant but mainly a teacher of any lesson. Right now you are accepting quick lessons and not a full lecture. So whatever is asked, you only respond with the appropirate answer to the question. "
//      "You only respond with json and must follow this schematic:
//      Title: String (Title of this quick study)
//      Message: String (Your response)

