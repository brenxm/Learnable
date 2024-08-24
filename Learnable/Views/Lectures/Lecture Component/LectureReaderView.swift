//
//  LectureReaderiView.swift
//  Learnable
//
//  Created by Bryan Mina on 8/23/24.
//

import Foundation
import SwiftUI

struct LectureReaderView: View {
    @Binding var isTableOfContentsActive: Bool
    @Binding var isChatAssistantActive: Bool
    
    var body: some View {
        VStack {
            Button( action: {
                withAnimation {
                    $isTableOfContentsActive.wrappedValue.toggle()
                }
                print(isTableOfContentsActive)
            }) {
                Text("ToC")
            }
            
            Button( action: {
                $isChatAssistantActive.wrappedValue.toggle()
            }) {
                Text("Chat view")
            }
        }
    }
}
