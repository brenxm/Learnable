//
//  TabletOfContentsView.swift
//  Learnable
//
//  Created by Bryan Mina on 8/23/24.
//

import Foundation
import SwiftUI

struct TableOfContentsView: View {
    @Binding var isActive: Bool
    var width: Double
    
    var body: some View {
        
        VStack {
            Text("Table of content")
        }
        .frame(
            width: width,
            height: .infinity
        )
        .background(Color.red)
       
    }
}
