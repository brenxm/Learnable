//
//  TabletOfContentsView.swift
//  Learnable
//
//  Created by Bryan Mina on 8/23/24.
//

import Foundation
import SwiftUI

struct TableOfContentsView: View {
    
    var lectureData: GeneratedLectureObject
    @Binding var isActive: Bool
    var width: Double
    
    var body: some View {
        ScrollView {
            VStack ( alignment: .leading ){
                Text(lectureData.subjectTitle)
                    .font(.system(size: 30))
                    .fontWeight(.medium)
                
                TableOfContentsTopicGroupView(topics: lectureData.topics)
            }
            
            Spacer()
        }
        .frame(
            width: width
        )
        .background(Color.red)
    }
}

struct TableOfContentsTopicGroupView: View {
    var topics: [TopicResponseFormat]
    
    var body: some View {
        ForEach (topics, id: \.self) { data in
            Text(data.title)
                .padding(.leading, 10)
            
            ForEach (data.content, id: \.self) { subData in
                Text( subData.subTopic )
                    .padding(.leading, 20)
            }
        }
    }
}
