//
//  QuickStudyPrompt.swift
//  Learnable
//
//  Created by Bryan Mina on 6/16/24.
//

import Foundation


struct QuickStudyPrompt: PromptRules {
    static var shared = QuickStudyPrompt()
    
    var systemPrompt: String = "You are a teacher. You assist the user to questions."

    var responseFormat: ResponseFormatProtocol = QuickStudyFormat()
    
    var systemAndResponseFormat: String {
        "\(systemPrompt).\("Only response in JSON format. This is the schema: {\n \(responseFormat.propertiesInString())\n}")"
    }
}

struct QuickStudyFormat: ResponseFormatProtocol {
    var message: String = ""
}
