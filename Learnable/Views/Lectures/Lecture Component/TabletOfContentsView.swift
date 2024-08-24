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
        ZStack (alignment: .leading){
            
            // Cancelling click box
            Rectangle()
                .fill(
                    Color(
                        red: 0,
                        green: 0,
                        blue: 0,
                        opacity: isActive ? 0.01 : 0
                    ))
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity
            )
            .onTapGesture {
                withAnimation {
                    $isActive.wrappedValue.toggle()
                }
            }
            .disabled(!isActive)
            
            
            // Contents
            RoundedRectangle(cornerRadius: 10)
            .fill(Color.red)
            .frame(
                maxWidth: width,
                maxHeight: .infinity
               // alignment: .leading
            )
            .shadow(radius: 10)
        }
    }
}
