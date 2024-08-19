//
//  LectureView.swift
//  Learnable
//
//  Created by Bryan Mina on 8/19/24.
//

import Foundation
import SwiftUI

// Schema needed ////
// Title: STRING
// blurb: STRING
// topics: [ {
//  topicTitle: STRING
//    subTopics: [
//      {
//          title: STRING
//          body: STRING
//      }
//    ]
// }]


struct LectureView: View {
    
    @Binding var generatedLecture: GeneratedLectureObject
    
    var body: some View {
        Text(generatedLecture.subjectTitle)
        Text(generatedLecture.blurb)
    }
}
