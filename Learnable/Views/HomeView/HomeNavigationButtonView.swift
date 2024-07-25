//
//  HomeNavigationButtonView.swift
//  Learnable
//
//  Created by Bryan Mina on 7/6/24.
//

import Foundation
import SwiftUI

struct HomeNavigationButtonView: View {
    var body: some View {
        NavigationStack {
            NavButton(icon: "pileofbooks.circle.light", title: "Subjects", destination: AnyView(
                PageView(
                    title: "Subjects",
                    topTrailingButton: AnyView(PageAddButton(""){
                        print("clicked add button")
                    }))
                {
                    AnyView(SubjectsView())
                }
            ))
            
            NavButton(icon: "thinking.circle.light", title: "Quick Study", destination: AnyView(MessageView(title: "")))
            
            NavButton(icon: "paper.circle.light", title: "Questions", destination: AnyView(QuestionsView()))
            
            NavButton(icon: "statistic.circle.light", title: "My Progress", destination: AnyView(MyProgressView()))
        }
        .padding(.vertical, 8)
    }
}

//** Components for NavigationButton View **//
struct NavButton: View {
    var icon: String
    var title: String
    var destination: AnyView
    
    var body: some View {
        NavigationLink(destination: destination) {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.white)
                .frame(maxWidth: .infinity, maxHeight: 80)
                .overlay {
                    HStack (spacing: 20){
                        Image(icon)
                            .resizable()
                            .frame(width: 55, height: 55)
                        
                        Text(title)
                            .foregroundColor(Color(white: 0.15))
                        
                        Spacer()
                        
                    }
                    .padding(.horizontal, 15)
                }
        }
    }
}
