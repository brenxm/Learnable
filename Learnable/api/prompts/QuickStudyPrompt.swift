//
//  QuickStudyPrompt.swift
//  Learnable
//
//  Created by Bryan Mina on 6/16/24.
//

import Foundation


struct QuickStudyPrompt: PromptEntity {
    static var shared = QuickStudyPrompt()
    
    var systemPrompt: String = ""

    var responseFormat: AnyJsonFormat? = AnyJsonFormat(QuickStudyFormat(title: "Title", message: "Some message"))
    
    var prompt: String {
        """
        \(systemPrompt)
        \(responseFormat != nil ? "Only response in JSON format. This is the schema: \( responseFormat!.format.propertiesInString())" : "")
        """
    }
}

struct QuickStudyFormat: JsonFormat, Decodable {
    var title: String
    var message: String
    
    func propertiesInString() -> String {
        let mirror = Mirror(reflecting: self)
        let arrString = mirror.children.map { "\($0.label!): \(type(of: $0.value))"}
        return arrString.joined(separator: ",\n")
    }
}
