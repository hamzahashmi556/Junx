//
//  NavigationBar.swift
//  junxApp
//
//  Created by Hamza Hashmi on 13/11/2023.
//

import SwiftUI

struct NavigationItem {
    var image: ImageResource
    var action: (() -> Void)? = nil
}

struct NavigationBar: View {
    
    @State var title = ""
    
    @State var rightItems: [NavigationItem] = []
    @State var leftItems: [NavigationItem] = []
    
    @State var rightPadding = 0.0
    @State var leftPadding = 0.0
    
    @State var height = 30.0
    
    var body: some View {
        
        ZStack {
            
            // Logo or Text
            if title.isEmpty {
                Image(.textImageLogo)
            }
            else {
                Text(title)
                    .font(.customFont(name: .inter, type: .regular, size: 16))
            }
            
            // Left Items
            
            HStack {
                
                ForEach(0 ..< leftItems.count, id: \.self) { id in
                    Image(leftItems[id].image)
                }
                
                Spacer()
            }
            .padding(.leading, leftPadding)

            
            // Right Items
            HStack {
                Spacer()
                
                ForEach(0 ..< rightItems.count, id: \.self) { id in
                    Group{
                        Image(rightItems[id].image)
                            .resizable()
                            .frame(width: 24, height: 24, alignment: .center)
                        
                    }.frame(width: 24, height: 24, alignment: .center)
                   
                    
                }
            }
            .padding(.trailing, rightPadding)
        }
        .frame(height: height)
    }
}

#Preview {
    VStack {
        
        NavigationBar(rightItems: [NavigationItem(image: .heart, action: {}),
                                   NavigationItem(image: .notification, action: {})],
                      leftItems: [NavigationItem(image: .menu, action: {})],
                      rightPadding: 20,
                      leftPadding: 24)
        
        Spacer()
    }
}
