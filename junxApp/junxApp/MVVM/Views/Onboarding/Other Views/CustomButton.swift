//
//  CustomButton.swift
//  junxApp
//
//  Created by Hamza Hashmi on 22/10/2023.
//

import SwiftUI

struct CustomButton: View {
    
    @State var title: String
    
    @State var width: CGFloat
    
    @State var action: () -> Void
    
    var body: some View {
        
        Button(action: action) {
            ZStack {
                LinearGradient(colors: [.buttonLinear1, .buttonLinear2],
                               startPoint: .leading,
                               endPoint: .trailing)
                .clipShape(RoundedRectangle(cornerRadius: 32))
                
                Text(title)
                    .font(.customFont(name: .inter, type: .bold, size: 16))
                
            }
            .foregroundStyle(.white)
            .frame(width: width, height: width * 0.2)
        }
    }
}

struct CustomButtonLightGreen: View {
    
    @State var title: String
    
    @State var width: CGFloat
    
    @State var action: () -> Void
    
    var body: some View {
        
        Button(action: action) {
            ZStack {
               Color("button linear 2")
                .clipShape(RoundedRectangle(cornerRadius: 32))
                
                Text(title)
                    .font(.customFont(name: .inter, type: .light, size: 14))
                
            }
            .foregroundStyle(.white)
            .frame(width: width, height: width * 0.2)
        }
    }
}


struct CustomBorderButton: View {
    
    @State var title: String
    
    @State var width: CGFloat
    
    @State var action: () -> Void
    
    var body: some View {
        
        Button(action: action) {
            ZStack {
               Color("button linear 2")
                .clipShape(RoundedRectangle(cornerRadius: 32))
                
                Text(title)
                    .font(.customFont(name: .inter, type: .light, size: 14))
                
            }
            .foregroundStyle(.white)
            .frame(width: width, height: width * 0.2)
        }
    }
}


#Preview {
    CustomButton(title: "Tester", width: 375, action: {
        
    })
}
