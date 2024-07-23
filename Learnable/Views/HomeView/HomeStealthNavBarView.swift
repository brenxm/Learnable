//
//  HomeStealthNavBarView.swift
//  Learnable
//
//  Created by Bryan Mina on 7/6/24.
//

import Foundation
import SwiftUI

struct HomeStealthNavBarView: View {
    var body: some View {
        HStack {
            Image("halfgear.light")
                .resizable()
                .frame(width: 40, height: 40)
        }
        .frame(maxWidth: .infinity, alignment: .trailing)
        .padding(.horizontal, 23)
        .padding(.bottom, 2)
    }
}
