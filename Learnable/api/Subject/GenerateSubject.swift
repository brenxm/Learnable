//
//  GenerateSubject.swift
//  Learnable
//
//  Created by Bryan Mina on 8/12/24.
//

import Foundation




func GenerateSubject(_ curriculumProposal: CurriculumFormat, _ completionFn: @escaping (_ generatedLecture: GeneratedLectureObject) -> Void ) async -> Void {
    
    
    let dataManager = SubjectCreator(topicCount: curriculumProposal.topics.count)
    
    
    
    // Generates the blurb
    fetchChatCompletion(prompt: GenerateSubjectPrompt(type: .blurb, curriculum: curriculumProposal)) {
        dataManager.setBlurb($0!)
    }
    
    // Navigate to loading view here
    
    for i in 0..<curriculumProposal.topics.count {
        Task {
            var formattedObj: TopicResponseFormat? = nil
            
            fetchChatCompletion(prompt: GenerateSubjectPrompt(type: .topic, curriculum: curriculumProposal, topic: curriculumProposal.topics[i])) {
                formattedObj = formatResponse(format: TopicResponseFormat(), message: $0!)
                    print(formattedObj!)
                    
                    if let unwrappedValue = formattedObj {
                        dataManager.setTopic(i: i, unwrappedValue)
                        print(dataManager.successfulRequestCount())
                        print("done")
                        
                    }
                    
                    if (dataManager.successfulRequestCount() == curriculumProposal.topics.count) {
                        print("completed results")
                        
                        dataManager.printCounts()
                        
                        do {
                            let generatedLecture =  GeneratedLectureObject(
                                subjectTitle: curriculumProposal.title,
                                blurb: try dataManager.getBlurb(),
                                topics: dataManager.getTopics()
                            )
                            completionFn(generatedLecture)
                            
                            
                        } catch {
                                print("Blurb from dataManager returned a 'nil'.")
                        }
                    }
                }
        }
    }
}



// main prompt
func GenerateSubjectPrompt(type: GenerationSubjectType, curriculum: CurriculumFormat, topic: CurriculumTopic? = nil) -> String {
    return """
You just generated a list of curriculum. And you will to generate its body and content. This is the curriculum you just generated.
You are not generating the entire content all in one prompt. There should be an assigned part that you are required to generate. The entire curriculum will be generated by multitple prompt. First is the summary of this lecture or blurb. And one prompt for each topic.

The curriculum generated:
\(curriculum.title)
\( curriculum.topicsToString()) )

This is your assigned content to generate:
\( type == .blurb ? "Blurb or summary of this curriculum. Your response should only be in JSON format with the schema of { type: 'blurb, content: <Your generated content here in string>'}" : "You will generate the body of each subTopic of \(subTopicToString(topic: topic!)). Your response should only be in JSON format with the schema of { title: \(topic!.title), content: [ <your generated content here, each element in this array is in object with schema of { subTopic: < the subTopic >, body: < lecture body you will generate pertaining to this subtopic >}> ]}")
})

Ensure that your generated body is comprehensive, which includes examples, step by step process etc similar to a book. Preferrably, it's a large body, which states every possible points. Missing nothing.
"""
}

func subTopicToString (topic: CurriculumTopic ) -> String {
    let titleString = "title: \(topic.title)"
    let topicsToString = topic.subTopics.map { "subtopic: \($0)"}.joined(separator: ", ")
    return "\(titleString) and these are the topics: [\(topicsToString)]"
}



enum GenerationSubjectType {
    case blurb
    case topic
}


class SubjectCreator {
    private var topics: [TopicResponseFormat?] = []
    private var blurb: String? = ""
    
    init( topicCount: Int) {
        self.topics = Array(repeating: nil, count: topicCount)
    }
    
    func setTopic(i: Int, _ topic: TopicResponseFormat) {
        self.topics[i] = topic
    }
    
    func successfulRequestCount() -> Int {
        let noneNilArr = self.topics.compactMap {$0}
        print(noneNilArr.count)
        return noneNilArr.count
    }
    
    func setBlurb(_ blurb: String) {
        self.blurb = blurb
    }
    
    func getBlurb() throws -> String {
        if let unwrappedBlurb = self.blurb {
            return unwrappedBlurb
        }
        
        throw ValueError.valueError
    }
    
    func getTopics() -> [TopicResponseFormat] {
        let unwrappedTopicValues = topics.map {$0!}
        return unwrappedTopicValues
    }
    
    // //////////////////   DEBUGGING    ////////////////////////// //
    
    // prints unwrapped count and total count ( nil and real value )
    func printCounts() {
        print("total count: \(self.topics.count)")
        print("clean count: \(self.topics.compactMap {$0}.count)")
    }
}

enum ValueError: Error {
    case valueError
}

struct TopicResponseFormat: Hashable, Codable {
    var id = UUID()
    var title: String = ""
    var content: [SubTopicResponseFormat] = []
}


struct SubTopicResponseFormat: Codable, Hashable {
    var id = UUID()
    var subTopic: String = ""
    var body: String = ""
}

// blurb requirements
//  type
//  body


// topic requirements
//  type
//  body

struct GeneratedLectureObject {
    let subjectTitle: String
    let blurb: String
    
    let topics: [TopicResponseFormat]
}
