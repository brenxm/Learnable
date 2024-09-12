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
            VStack {
                Text(lectureData.subjectTitle)
                    .font(.system(size: 30))
                    .fontWeight(.medium)
                
                ForEach (lectureData.topics, id: \.self) { data in
                    Text(data.title)
                    
                    ForEach (data.content, id: \.self) { subData in
                        Text( subData.subTopic )
                    }
                }
            }
            
            Spacer()
        }
        .frame(
            width: width
           
        )
    }
    
    
    
}
