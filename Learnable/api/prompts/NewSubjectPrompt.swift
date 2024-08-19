//
//  NewSubjectPrompt.swift
//  Learnable
//
//  Created by Bryan Mina on 7/30/24.
//

import Foundation


// Prompt to Generate new subject proposal
struct NewSubjectPrompt: PromptRules {
    static var shared = NewSubjectPrompt()
    var systemPrompt: String = """
You are a system that the only task is to generate a curriculum for a subject specified by the user.
You follow a procedural structure flow which each user prompt has their own set specific respond handle.
You can only respond in JSON schema, and each responses are chosen based on the user prompt.
These are the only allowed JSON schema respond you can send.
1. clarifying:
{
    “type”: “clarifying”,
    “message”: STRING
}

2. restartConvoProposal :
{
    “type”: “restartConvoProposal”,
    “message”: STRING <your message>
}

3. normalConvo:
{
    “type”: “normalConvo”,
    “message”: STRING <your message>
}

4. curriculumProposal:
{
    “type”: “curriculumProposal”,
    “message”: STRING <your message>
    “curriculum”: JSON
}

4.2 The curriculum schema:
{
    “title”: STRING,
    “topics”: [
        {
            “title”: STRING
            “subTopics”: [STRING]
        }
    ]
}

5. confirmation:
{
    “type”: “confirmation”,
    "message": STRING
    “curriculum”: JSON
    
}

6. restartConvo:
{
    “type”: “restartConvo”
    "message": STRING
}

7. Initial:
{
    “type”: “initialGreeting”
    “message”: STRING <your message here>
}

If the user is sending irrelevant prompt or asking quick questions, explain that your task is only to generate a subject.
"""
    
    var responseFormat: ResponseFormatProtocol = NewSubjectFormat()
    
    var systemAndResponseFormat: String {
        "\(systemPrompt). Response only in JSON format and this is the schema: {\n \(responseFormat.propertiesInString())\n}"
    }
}

struct NewSubjectFormat: ResponseFormatProtocol {
    var message: String = ""
}


struct CurricuLumProposalFormat: Codable {
    var message: String = ""
    var curriculum: CurriculumFormat = CurriculumFormat()
}

struct CurriculumFormat: Codable, Hashable  {
    var title: String = ""
    var topics: [CurriculumTopic] = []
    
    func topicsToString() -> String {
        self.topics.map { "{title: \($0.title), topics: [\($0.subTopics.joined(separator: ", "))]}"}.joined(separator: ",\n")
    }
}

struct CurriculumTopic: Codable, Hashable {
    var title: String = ""
    var subTopics: [String] = []
}


// Schema for full Subject object
// Title: String
//      Summary of this subject: String
// [
//  {
//      Topic Title: String
//      Description of this Topic: String
//      [
//         {
//              subtopic title: String
//              lecture body: String
//         }
//      ]
//  }
// ]

struct GeneratedSubject {
    var title: String
    var summary: String
    var topic: [SubjectTopic]
}

struct SubjectTopic {
    var title: String
    var description: String
    var subTopic: [SubjectSubTopic]
}

struct SubjectSubTopic {
    var title: String
    var subTopicBody: String
}
