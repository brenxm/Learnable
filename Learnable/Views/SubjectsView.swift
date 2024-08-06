//
//  SubjectsView.swift
//  Learnable
//
//  Created by Bryan Mina on 7/7/24.
//

import Foundation
import SwiftUI

struct SubjectsView: View {
    @StateObject var subjectViewModel = SubjectsViewModel.shared
    
    var body: some View {
        VStack (spacing: 0){
            SortDateView()
            
            List(subjectViewModel.subjects, id: \.self){ data in
                SubjectButtonElement(subjectObj: data, title: data.title, chapterCount: data.chapterCount, completionPercentage: data.completionPercentage, lastRead: data.lastRead)
                    .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
        }
    }
}

struct SortDateView: View {
    @State var selectedSort: SortOptions = .lastReadDate
    
    enum SortOptions: String {
        case lastReadDate
        case name
        
        var description: String {
            switch self {
            case .lastReadDate:
                return "Date last read"
            case .name:
                return "Name"
            }
        }
    }
    
    var body: some View {
        HStack {
            Text("Sort by:")
            Text(selectedSort.description)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .font(.system(size: 12))
        .foregroundStyle(Color(white: 0.5))
        .padding(0)
        .padding(.leading, 10)
        .onTapGesture {
            selectedSort = selectedSort == .lastReadDate ? .name : .lastReadDate
        }
    }
}

// Each subject items in Subjects
struct SubjectButtonElement: View {
    let subjectObj: SubjectModel
    let title: String
    let chapterCount: Int
    let completionPercentage: Double
    let lastRead: Date
    let dateFormatter = DateFormatter()
    
    var dateToString: String {
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        dateFormatter.locale = Locale(identifier: "en_US")
        return dateFormatter.string(from: self.lastRead)
    }
    
    var body: some View {
        ZStack {
            // Bottom layer
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .frame(height: 70)
                .shadow(color: Color(white: 0.85), radius: 2.5, x: 3, y: 3)
                .overlay {
                    HStack{
                        Spacer()
                        Image(systemName: "trash.fill")
                            .resizable()
                            .frame(width: 18, height: 18)
                            .foregroundStyle(Color(white: 0.75))
                            .padding(.trailing, 5)
                    }
                }
                
            // top layer
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .frame(height: 70)
                .shadow(radius: 10)
                .padding(0)
                .padding(.trailing, 25)
                .overlay(alignment: .leading) {
                    HStack {
                        // Logo
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color(white: 0.5))
                            .frame(width: 50)
                            .padding(.vertical, 5)
                            .padding(.leading, 5)
                            .overlay (alignment: .center){
                                let index = title.index(title.startIndex, offsetBy: 2)
                                let firstTwoString = title[..<index].capitalized
                                Text(firstTwoString)
                                    .font(.system(size: 35))
                            }
                        // Text Information
                        VStack (alignment: .leading){
                            Text(title)
                                .font(.system(size: 18))
                                .foregroundStyle(Color(white: 0.1))
                            
                            Text("\(chapterCount)chapters")
                                .font(.system(size: 10))
                                .foregroundStyle(Color(white: 0.5))
                            
                            SubjectButtonProgressBarView(completionPercentage: completionPercentage)
                            
                            HStack {
                                Text("\(Int(completionPercentage))% complete")
                                    .font(.system(size: 10))
                                    .foregroundStyle(Color(white: 0.5))
                                
                                Text("Last read: \(dateToString)")
                                    .font(.system(size: 10))
                                    .foregroundStyle(Color(white: 0.5))
                            }
                        }
                        .padding(.leading, 7)
                    }
                    
                }
                .frame(alignment: .leading)
                .mask {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(height: 70)
                }
                .onTapGesture {
                    print("touched this \(subjectObj)")
                    SubjectsViewModel.shared.deleteSubject(obj: subjectObj)
                }
        }
    }
}

struct SubjectButtonProgressBarView: View {
    let widthSize = 120.0
    let percentageWidthSize: Double
    
    init(completionPercentage: Double) {
        self.percentageWidthSize = completionPercentage * widthSize / 100.0
    }
    
    var body: some View {
        ZStack (alignment: .leading){
            //
            // Background
            RoundedRectangle(cornerRadius: 5)
                .fill(Color(white: 0.9))
                .frame(width: widthSize, height: 5)
            
            
            // Foreground
            RoundedRectangle(cornerRadius: 5)
                .fill(Color.limeGreen)
                .frame(width: percentageWidthSize, height: 5)
        }
    }
}
