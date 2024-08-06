//
//  GlobalUIComponentViews.swift
//  Learnable
//
//  Created by Bryan Mina on 7/7/24.
//

import Foundation
import SwiftUI

struct PageView: View {
    @Environment(\.dismiss) var dismiss
    
    var title: String
    var topTrailingButton: AnyView
    var hasBackButton: Bool
    var content: AnyView
    
    init(title: String, topTrailingButton: AnyView, hasBackButton: Bool = false, _ content: () -> AnyView) {
        self.title = title
        self.topTrailingButton = topTrailingButton
        self.hasBackButton = hasBackButton
        self.content = content()
    }
    
    var body: some View {
        VStack (spacing: 0 ){
            HStack{
                PageTitle(title)
                    
                Spacer()
                
                topTrailingButton
                
            }
            .frame(maxWidth: .infinity)
            .padding(.trailing, 10)
           
            
            PageDivider()
            
            content
                .frame(maxHeight: .infinity)
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: {
                    dismiss()
                }) {
                    PageDismissButton()
                }
            }
        }
    }
}

// ** for pages title ** //
struct PageTitle: View {
    var title: String
    
    init(_ title: String){
        self.title = title
    }
    
    var body: some View {
        Text(title)
            .font(.system(size: 25))
            .padding(.horizontal, 15)
    }
}

struct PageDivider: View {
    
    var topPadding: Double
    var botPadding: Double
    
    //Assign default paddings. Top = 1.5 and Bottom = 10
    init(topPadding: Double, botPadding: Double){
        self.topPadding = topPadding
        self.botPadding = botPadding
    }
    
    init(){
        self.topPadding = 1.5
        self.botPadding = 10
    }
    
    
    init(topPadding: Double){
        self.topPadding = topPadding
        self.botPadding = 10
    }
    
    init(botPadding: Double){
        self.topPadding = 1.5
        self.botPadding = botPadding
    }
    
    
    var body: some View {
        Divider()
            .padding(.top, self.topPadding)
            .padding(.bottom, self.topPadding)
    }
}

struct PageDismissButton: View {
    var body: some View {
        HStack {
            Image(systemName: "chevron.left")
                .resizable()
                .foregroundStyle(Color(white: 0.5))
                .frame(width: 10, height: 10)
                
            
            Text("Back")
                .font(.system(size: 15))
                .foregroundStyle(Color(white: 0.5))
        }
    }
}

struct PageAddButton: View {
    var label: String
    var action: () -> Void
    
    init(_ label: String, action: @escaping () -> Void) {
        self.label = label
        self.action = action
    }
    var body: some View {
        RoundedRectangle(cornerRadius: 15)
            .fill(Color.limeGreen)
            .frame(width: 120, height: 20)
            .overlay {
                HStack {
                    Image(systemName: "plus")
                        .resizable()
                        .frame(width: 12, height: 12)
                    Text(label)
                        .font(.system(size: 12))
                }
                .padding(.horizontal, 5)
            }
            .onTapGesture {
                action()
            }
    }
}

struct ButtonView: View {
    var icon: String
    var label: String
    var clickFn: () -> Void
    
    init(icon: String, label: String,clickFn: @escaping () -> Void) {
        self.icon = icon
        self.label = label
        self.clickFn = clickFn
    }

    var body: some View {
        RoundedRectangle(cornerRadius: 5)
            .fill(Color(white: 0.75))
            .frame(width: 70, height: 25)
            .overlay {
                HStack {
                    CustomIcon(icon)
                        .resizable()
                        .frame(width: 13, height: 13)
                       
                    Text(label)
                        .font(.system(size: 10))
                }
                
            }
            .onTapGesture {
                clickFn()
            }
    }
    
    func CustomIcon( _ value: String) -> Image {
        if let uiImage = UIImage(named: value) {
            return Image(uiImage: uiImage)
    
        } else if let systemImage = UIImage(systemName: value) {
            return Image(uiImage: systemImage)
        } else {
            print("Error: Unable to find image with name \(value) in catalog or system")
            return Image(systemName: "Exclamation")
        }
    }
}

// Used for trailing top right button
struct CustomnNavViewButton<T: View>: View {
    var  destination: () -> T
    
    init(_ destination: @escaping () -> T) {
        self.destination = destination
    }
    
    var body: some View {
        NavigationLink(destination: destination) {
            RoundedRectangle(cornerRadius: 5)
                .fill(Color.limeGreen)
                .frame(width: 150, height: 30)
                .overlay {
                    HStack {
                        Text("Add subject")
                            .font(.system(size: 14))
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 15, height: 15)
                    }
                }
        }
        .foregroundStyle(Color.black)
    }
}
