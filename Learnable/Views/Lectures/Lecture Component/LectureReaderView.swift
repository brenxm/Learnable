//
//  LectureReaderiView.swift
//  Learnable
//
//  Created by Bryan Mina on 8/23/24.
//

import Foundation
import SwiftUI

struct LectureReaderView: View {
    // //////// UI interaction variables //////// //
    @Binding var isTableOfContentsActive: Bool
    @Binding var isChatAssistantActive: Bool
    @State var viewingTopic: Int?
    
    // ////////// Displayed data ///////////
    var data: GeneratedLectureObject
    
    
    var body: some View {
        VStack {
            LectureViewTitlePage(
                title: data.subjectTitle,
                blurb: data.blurb
            )
        }
        .frame(
            minWidth: UIScreen.main.bounds.width,
            maxHeight: .infinity
        )
    }
}



// title page
struct LectureViewTitlePage: View {
    var title: String
    var blurb: String
    
    var body: some View {
        Text(title)
        Text(blurb)
    }
}
// subtopic page
