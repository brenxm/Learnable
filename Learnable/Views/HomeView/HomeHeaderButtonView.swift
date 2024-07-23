//
//  HomeHeaderButtonView.swift
//  Learnable
//
//  Created by Bryan Mina on 7/6/24.
//

import Foundation
import SwiftUI

struct HomeHeaderButtonView: View {
    var body: some View {
        VStack {
            ZStack{
                // Bottom Layer
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .fill(Color.white)
                    
                    HStack {
                        Spacer()
                        Image("pluscircle.light")
                            .resizable()
                            .frame(width: 30, height: 30)
                    }
                    .padding(10)
                }
                                
                // Top Layer
             
                HStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 30)
                            .fill(Color.white)
                            .frame(width: 330)
                            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 2)
                        
                        //RecentLectureContentView()
                        NewLectureContentView()
                    }
                    Spacer()
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 250)
        .mask {
            RoundedRectangle(cornerRadius: 30)
                .frame(maxWidth: .infinity, maxHeight: 250)
        }
    }

    // Button content without data, prompt user to add
    func NewLectureContentView() -> some View {
        return VStack {
            Text("No subjects to show")
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(red: 0.2, green: 0.2, blue: 0.2))
                .frame(width: 150, height: 40)
                .overlay {
                    Text("Add subject")
                        .foregroundColor(Color(white: 0.95))
                }
        }
    }
    
    // Button content with data
    func RecentLectureContentView() -> some View {
        let labelColor: Double = 0.5 // Range of 0 - 1
        let textColor: Double = 0.4 // Range 0 - 1
        
        func labelAndValue(_ label: String, _ text: String) -> some View {
            VStack (alignment: .leading,spacing: 3){
                Text(label)
                    .font(.system(size: 13))
                    .foregroundColor(Color(red: labelColor, green: labelColor, blue: labelColor))
                
                Text(text)
                    .font(.system(size: 15))
                    .foregroundColor(Color(red: textColor, green: textColor, blue: textColor))
            }
        }
        
        return HStack {
            VStack {
                RoundedRectangle(cornerRadius: 1000)
                    .fill(Color(red: 0.85, green: 0.85, blue: 0.85))
                    .frame(width: 140, height: 140)
                    .overlay {
                        Image("bookpen.light")
                            .resizable()
                            .frame(width: 100, height: 100)
                    }
                
                Spacer()
                    .frame(height: 17)
                
                RoundedRectangle(cornerRadius: 30)
                    .fill(Color.green)
                    .frame(width: 150, height: 40)
                    .overlay {
                        Text("Resume")
                    }
            }
            .frame(maxHeight: .infinity)
            
            VStack (alignment: .leading, spacing: 10) {
                VStack (alignment: .leading, spacing: 5) {
                    // (Text) Title
                    Text("Algebra")
                        .font(.system(size: 23))
                    // (Text) % completion
                    Text("95% complete")
                        .font(.system(size: 13))
                }
                
                labelAndValue("correct/total", "100 / 120")
                labelAndValue("current topic", "polynomials")
               
                // Optional button -> Take quiz
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color.orange)
                    .frame(width: 70, height: 18)
                    .overlay {
                        Text("Take quiz")
                            .font(.system(size: 10))
                    }
            }
            .frame(maxWidth: 150, maxHeight: .infinity)
        }
    }
}
