//
//  MyProgressView.swift
//  Learnable
//
//  Created by Bryan Mina on 7/9/24.
//

import Foundation
import SwiftUI

struct MyProgressView: View {
    @Environment(\.dismiss) var dismiss
    
    var myProgressViewModel = MyProgressViewModel.shared
    
    var body: some View {
        VStack (alignment: .leading, spacing: 0){
            PageTitle("My Progress")
            PageDivider()
            
            // Quizzes streak view
            VStack (spacing: 20) { // container of streak views containers
                StreakView(title: "Daily quizzes streak", icon: "paper.light")
                StreakView(title: "Daily one hour lecture streak", icon: "book.light")
            }
            .padding(.vertical, 20)
            
            // One hour lecture streak view
            
            // Stats
            HStack (alignment: .center) {
                Image("statistic.light")
                    .resizable()
                    .frame(width: 25, height: 25)
                Text("Lifetime stats")
            }
            .frame(maxWidth: .infinity)
            .padding(.bottom, 10)
            
            
            Divider()
            // Contents of Stats
            VStack (spacing: 30){
                HStack (spacing: 20) {
                    LifeStatComponentView(value: String(myProgressViewModel.correctAnswer), label: "Correct answers")
                    
                    Spacer()
                    
                    LifeStatComponentView(value: String(myProgressViewModel.totalQuestion), label: "Total Answer")
                }
                .padding(.horizontal, 40)
                
                HStack (spacing: 20) {
                    LifeStatComponentView(value: String(myProgressViewModel.booksGenerated), label: "Books generated")
                    
                    Spacer()
                    
                    LifeStatComponentView(value: String(myProgressViewModel.booksCompleted), label: "Books completed")
                }
                .padding(.horizontal, 40)
            }
            .padding(.top, 30)
            
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: {
                    dismiss()
                }){
                    PageDismissButton()
                }
            }
        }
    }
}

struct StreakView: View {
    var title: String
    var icon: String
    
    var days = [
        "Sun",
        "Mon",
        "Tue",
        "Wed",
        "Thu",
        "Fri",
        "Sat"
    ]
    
    var body: some View {
        VStack (spacing: 8 ){
            HStack {
                Image(icon)
                    .resizable()
                    .frame(width: 20, height: 20)
                
                Text(title)
                
            }
            .frame(maxWidth: .infinity)
            
            
            RoundedRectangle(cornerRadius: 15)
                .fill(Color(white: 0.95))
                .frame(height: 80)
                .padding(.horizontal, 20)
                .overlay {
                    HStack {
                        ForEach(days, id: \.self) { day in
                            VStack {
                                Image("fire.black.light")
                                    .resizable()
                                    .frame(width: 35, height: 35)
                                Text(day)
                            }
                            .frame(width: 40)
                        }
                    }
                }
        }
    }
}

struct LifeStatComponentView: View {
    var value: String
    var label: String
    
    var body: some View {
        VStack  {
            Text(value)
                .font(.system(size: 25))
                .foregroundStyle(Color(white: 0.2))
            Text(label)
                .font(.system(size: 13))
                .foregroundStyle(Color(white: 0.6))
        }
        .frame(maxWidth: .infinity)
    }
}
