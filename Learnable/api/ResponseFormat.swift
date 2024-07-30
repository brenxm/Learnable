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

protocol PromptRules {
    var systemPrompt: String { get }
    var responseFormat: ResponseFormatProtocol { get }
    var systemAndResponseFormat: String { get }
}

protocol ResponseFormatProtocol: Codable {
    var message: String { get }
    func propertiesInString () -> String
}

extension ResponseFormatProtocol {
    func propertiesInString() -> String {
        let mirror = Mirror(reflecting: self)
        let arrString = mirror.children.map { "\($0.label!): \(type(of: $0.value))"}
        return arrString.joined(separator: ",\n")
    }
}

struct DefaultResponseFormat: ResponseFormatProtocol {
    var message: String = ""
}
