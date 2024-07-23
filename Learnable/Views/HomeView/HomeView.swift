//
//  HomeView.swift
//  Learnable
//
//  Created by Bryan Mina on 7/5/24.
//

import Foundation
import SwiftUI

struct HomeView: View{
    
    var body: some View {
        NavigationStack{
            VStack(spacing: 0) {
                // Stealth top nav bar
                HomeStealthNavBarView()
                    .frame(maxWidth: .infinity, alignment: .trailing)
                
                HomeHeaderButtonView()
                HomeNavigationButtonView()
                
                HStack{}
                Spacer()
            }
            .padding(5)
            .background(Color(red: 0.9, green: 0.9, blue: 0.9))
        }
    }
}
