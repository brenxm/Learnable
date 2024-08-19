//
//  GenerateSubjectLoadingView.swift
//  Learnable
//
//  Created by Bryan Mina on 8/12/24.
//

import Foundation
import SwiftUI

struct GenerateSubjectLoadingView: View {
    @Binding var subjectGenerationCompleted: Bool
    @Binding var generatedLecture: GeneratedLectureObject
    
    var body: some View {
        Text("Generating Subject. Please wait")
        
        NavigationLink(destination: LectureView(generatedLecture: $generatedLecture), isActive: $subjectGenerationCompleted) {
            EmptyView()
        }
    }
}
