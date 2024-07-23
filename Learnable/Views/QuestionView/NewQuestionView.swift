//
//  NewQuestionView.swift
//  Learnable
//
//  Created by Bryan Mina on 7/21/24.
//

import Foundation
import SwiftUI

struct NewQuestionView: View {
    @Environment(\.dismiss) var dismiss
    
    let questionsModelView = QuestionsViewModel.shared
    var lectureOptions: [String]
    
    @State var selectedOption: String = "Uncategorized"
    @State var titleValue: String = ""
    @State var contextValue: String = ""
    @State var descriptionValue: String = ""
    @State var modalActive: Bool = false
    var data: QuestionModel?
    var mode: Mode = .create
    
    enum Mode {
        case edit
        case create
    }
    
    init(lectureOptions: [String], data: QuestionModel? = nil) {
        if let questionModel = data {
            self.selectedOption = questionModel.subjectQuestion ?? "Uncategorized"
            self.titleValue = questionModel.title
            self.contextValue = questionModel.context
            self.descriptionValue = questionModel.description
            self.data = data
            self.mode = .edit
        }
        
        self.lectureOptions = lectureOptions
    }
    
    
    var body: some View {
        ZStack {
            VStack (spacing: 8){
                LecturePicker(label: "Parent Lecture", modalActive: $modalActive, selectedOption: $selectedOption)
                TextInputField(label: "Title", value: $titleValue)
                
                TextInputField(label: "Context", value: $contextValue)
                
                TextEditorField(label: "Description", value: $descriptionValue)
                
                HStack {
                    Text("Edits will revert question back to level 1 and reset it's progress.")
                        .font(.system(size: 15))
                        .foregroundStyle(Color.orange)
                        .opacity(data != nil ? 1 : 0)
                    
                    AcceptButton() {
                        switch(mode) {
                        case .edit:
                            let newQ = QuestionModel(title: titleValue, context: contextValue, description: descriptionValue, level: 1, totalQuestionAsked: 0, correctAnswer: 0, subjectQuestion: selectedOption)
                            questionsModelView.editQuestion(q: data!, newQ: newQ)
                            dismiss()
                            
                        case .create:
                            let newQuestion = QuestionModel(title: titleValue, context: contextValue, description: descriptionValue, level: 1, totalQuestionAsked: 0, correctAnswer: 0, subjectQuestion: selectedOption)
                            
                            questionsModelView.addQuestion(q: newQuestion)
                            dismiss()
                        }
                    }
                }
                Spacer()
            }
            .padding(15)
            
            
            // Modal cancelling
            modalActive ?
            ZStack {
                VStack {
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(red: 0, green: 0, blue: 0, opacity: 0.1))
                .onTapGesture {
                    modalActive.toggle()
                }
                
                LectureOptionsModal(options: lectureOptions, selectedOption: $selectedOption, modalActive: $modalActive)
            } : nil
        }
    }
}



struct TextInputField: View {
    var label: String
    @Binding var value: String
    
    var body: some View {
        VStack (alignment: .leading, spacing: 2) {
            Text(label)
                .font(.system(size: 13))
            
            TextField("Some",text: $value)
                .font(.system(size: 14))
                .padding(4)
                .background(Color(white: 0.95))
                .cornerRadius(3)
        }
    }
}

struct TextEditorField: View {
    
    var label: String
    @Binding var value: String
    
    var body: some View {
        VStack (alignment: .leading, spacing: 2 ){
            Text(label)
                .font(.system(size: 13))
            
            RoundedRectangle(cornerRadius: 3)
                .fill(Color(white: 0.95))
                .frame(height: 200)
                .overlay {
                    TextEditor(text: $value)
                        .font(.system(size: 14))
                        .scrollContentBackground(.hidden)
                        .frame(height: 200)
                }
        }
    }
}

struct AcceptButton: View {
    
    var action: () -> Void
    
    var body: some View {
        HStack {
            Image("send.light")
                .resizable()
                .frame(width: 15, height: 13)
                .rotationEffect(.degrees(90))
            Text("Accept")
                .font(.system(size: 13))
        }
        .padding(7)
        .background(Color(white: 0.9))
        .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
//        .frame(maxWidth: .infinity, alignment: .trailing)
        .onTapGesture {
            action()
        }
    }
}

struct LecturePicker: View {
    
    var label: String
    @Binding var modalActive: Bool
    
    @Binding var selectedOption: String
    
    var body: some View {
        VStack (alignment: .leading)
        {
            Text(label)
                .font(.system(size: 13))
            HStack {
                Text(selectedOption)
                    .font(.system(size: 14))
                Image(systemName: "triangle.fill")
                    .resizable()
                    .frame(width: 11, height: 11)
                    .rotationEffect(.degrees(180))
                
            }
            .padding(6)
            .background(Color(white: 0.8))
            .cornerRadius(4)
            .onTapGesture {
                modalActive.toggle()
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct LectureOptionsModal: View {
    var options: [String]
    @Binding var selectedOption: String
    @Binding var modalActive: Bool
    
    var optionsss: [String] {
        if options.contains(where: {$0 == "Uncategorized"}) {
            return options
        } else {
            var temp = options
            temp.append("Uncategorized")
            return temp
        }
    }
    
    var body: some View {
        VStack (alignment: .leading, spacing: 5){
            ForEach(optionsss, id: \.self) { option in
                
                HStack {
                    Image(systemName: "checkmark")
                        .resizable()
                        .frame(width: 15, height: 15)
                        .foregroundColor(option == selectedOption ? .black : .clear)
                    
                    Text(option)
                }
                .onTapGesture {
                    selectedOption = option
                    modalActive.toggle()
                }
                
                Divider()
            }
            .listStyle(.plain)
        }
        .frame(maxWidth: 200)
        .padding(10)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 15)
    }
}
