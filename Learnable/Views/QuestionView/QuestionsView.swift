//
//  QuestionsView.swift
//  Learnable
//
//  Created by Bryan Mina on 7/11/24.
//

import Foundation
import SwiftUI

struct QuestionsView: View {
    @StateObject var questionsViewModel = QuestionsViewModel.shared
    @State var retractedCategoriesIndex: [IndexSet] = []
    @State var isEditingQuestion: Bool = false
    
    var categoriesToStrings: [String] {
        Array(Set(questionsViewModel.questions.map {$0.subjectQuestion ?? "Uncategorized"}))
    }
    
    var body: some View {
        PageView(
            title: "Questions",
            topTrailingButton: AnyView(NavigationLink(destination: NewQuestionView(lectureOptions: categoriesToStrings)) {
                Text("New Question")
            }),
            hasBackButton: true
        )
        {
            AnyView(
                ScrollView {
                    ForEach(questionCategorized(questions: questionsViewModel.questions, retractedIndex: retractedCategoriesIndex), id: \.self) { data in
                        ItemCategoryView(title: data.key, questions: data.questions)
                    }
                }
            )
        }
    }
    
    func questionCategorized(questions: [QuestionModel], retractedIndex: [IndexSet]) -> [ItemCategory] {
        var tempCategories: [ItemCategory] = []
        let noGroupCategoryName = "Uncategorized"
        
        for q in questions {
            // if this question belongs to subject
            if let subjectQuestion = q.subjectQuestion {
                let keys = tempCategories.filter { $0.key == subjectQuestion}
                    .map { String($0.key)}
                
                if keys.contains(subjectQuestion) {
                    let index = tempCategories.firstIndex(where: {$0.key == subjectQuestion})!
                    var data = tempCategories[index]
                    data.questions.append(q)
                    tempCategories[index] = data
                    
                } else {
                    let newCategory = ItemCategory(key: subjectQuestion, questions: [q])
                    tempCategories.append(newCategory)
                    
                }
                
            // If it does not, create/add a category for 'no subject category'
            } else {
                // If existing
                if let i = tempCategories.firstIndex( where: {$0.key == noGroupCategoryName }) {
                    var data = tempCategories[i]
                    data.questions.append(q)
                    tempCategories[i] = data
                    
                } else {
                    let newCategry = ItemCategory(key: noGroupCategoryName, questions: [q])
                    tempCategories.append(newCategry)
                }
            }
        }
        print("called")
        return tempCategories
    }
}

// Loop all questions,
// group items based on the subjectTitle
struct ItemCategory: Identifiable, Hashable {
    var id = UUID()
    var key: String
    var questions: [QuestionModel]
}

// Dropdown section
// Toggle on/off button
struct ItemCategoryView: View {
    var title: String
    var questions: [QuestionModel]
    
    @State var retracted: Bool = false
    
    var body: some View {
        VStack (spacing: 0){
            // Title - with clickable
            HStack {
                Text(title)
                    .font(.system(size: 16))
                    .foregroundStyle(Color(white: 0.3))
                Image(systemName: retracted ? "chevron.down" : "chevron.left")
                    .resizable()
                    .animation(nil)
                    
                    .frame(width: retracted ? 10 : 6, height: retracted ? 6 : 10)
                    .foregroundColor(Color(white: 0.4))
                    
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 10)
            .background(Color.white) // To allow clicking on whole bar instead of just the label
            .onTapGesture {
                withAnimation(.linear(duration: 0.15)) {
                    retracted.toggle()
                    print("getting called?")
                }
            }
            // List of retractable items
            VStack {
                ForEach (removeDuplicate(), id: \.self) { data in
                    ItemQuestionView(data: data)
                }
            }
            .frame(height: retracted ? nil : 0, alignment: .top) // nil is represents height being responsive to the content
            .padding(0)
            .clipped()
        }
    }
    
    func removeDuplicate() -> [QuestionModel] {
        Array(Set(questions))
    }
}

struct ItemQuestionView: View {
    var data: QuestionModel
    
    @State var buttonTrayOpen: Bool = false
    
    var body: some View {
        VStack {
            HStack { // title and context
                HStack {
                    Text(data.title)
                        .font(.system(size: 17))
                    
                    Text(data.context)
                        .font(.system(size: 11))
                        .foregroundStyle(Color(red: 0.1, green: 0.3, blue: 0.7))
                    }
                
                Spacer()
                
                HStack ( spacing: 2 ){
                    Text("Level: \(data.level)")
                        .font(.system(size: 10))
                    
                    Image("paper.light")
                        .resizable()
                        .frame(width: 12, height: 12)
                    
                    Text("\(data.correctAnswer)/\(data.totalQuestionAsked)")
                        .font(.system(size: 10))
                }
            }
            
            Text(data.description) // description
                .font(.system(size: 11))
                .foregroundStyle(Color(white: 0.3))
            
              buttonTrayOpen ? HStack { // Menu button
                  NavigationLink(
                    destination: NewQuestionView(lectureOptions: Array(Set(QuestionsViewModel.shared.questions.map {$0.subjectQuestion ?? "Uncategorized"})), data: data))
                    {
                      Text("Edit")
                          .font(.system(size: 12))
                  }
                
                ButtonView(icon: "trash.fill", label: "delete") {
                    print("clicked delete button")
                    QuestionsViewModel.shared.removeQuestion(q: data)
                }
                
                Spacer()
              } : nil
        }
        .padding(10) // Padding to push internal content
        .background(Color(white: 0.9))
        .cornerRadius(5)
        .padding(.horizontal, 15) // Padding to push out boundaries
        .padding(.bottom, 7.5)
        .onTapGesture {
            withAnimation(.linear(duration: 0.1)) {
                buttonTrayOpen.toggle()
            }
        }
    }
}


