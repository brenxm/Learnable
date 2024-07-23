//
//  QuestionsViewModel.swift
//  Learnable
//
//  Created by Bryan Mina on 7/12/24.
//

import Foundation

class QuestionsViewModel: SingletonViewModel ,ObservableObject {

    static var shared = QuestionsViewModel()
    @Published var questions: [QuestionModel] = [
        QuestionModel(title: "Let syntax", context: "Swift programming language", description: "Some blah blah blha, this is a blah blah blah, whatevery yuou say is a blah blah blah, hehehe blah blah blah", level: 3, totalQuestionAsked: 30, correctAnswer: 20, subjectQuestion: "Swift"),
        
        QuestionModel(title: "Var syntax", context: "Swift programming language", description: "Some blah blah blha, this is a blah blah blah, whatevery yuou say is a blah blah blah, hehehe blah blah blah", level: 2, totalQuestionAsked: 50, correctAnswer: 25, subjectQuestion: "Swift"),
        
        QuestionModel(title: "For loop", context: "Swift programming language", description: "Some blah blah blha, this is a blah blah blah, whatevery yuou say is a blah blah blah, hehehe blah blah blah", level: 4, totalQuestionAsked: 50, correctAnswer: 35, subjectQuestion: "Possy"),
        
        QuestionModel(title: "For loop", context: "Swift programming language", description: "Some blah blah blha, this is a blah blah blah, whatevery yuou say is a blah blah blah, hehehe blah blah blah", level: 4, totalQuestionAsked: 50, correctAnswer: 35, subjectQuestion: nil)
    ]
    
    func removeQuestion(q: QuestionModel) {
        self.questions.removeAll(where: {$0 == q})
    }
    
    func addQuestion(q: QuestionModel) {
        self.questions.append(q)
    }
    
    func editQuestion(q: QuestionModel, newQ: QuestionModel) {
        if let i = questions.firstIndex(where: {$0 == q}){
            questions[i] = newQ
            print("succesfully edited")
        } else {
            print("unable to find this question in the questiohns")
        }
    }	
}

struct QuestionModel: Hashable {
    var title: String
    var context: String
    var description: String
    var level: Int
    var totalQuestionAsked: Int
    var correctAnswer: Int
    var subjectQuestion: String? // Must be replaced type to questionModel from coreData
}
