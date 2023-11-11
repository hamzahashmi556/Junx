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
            .frame(width: width, height: 56)
        }
    }
}

struct CircleButton : View {
    @State var title: String
    
    @State var width: CGFloat
    
    @State var height: CGFloat
    
    @State var action: () -> Void
   
    var body: some View {
       
        Button(action: action) {
            ZStack {
                LinearGradient(colors: [.buttonLinear1, .buttonLinear2],
                               startPoint: .leading,
                               endPoint: .trailing)
                .clipShape(Circle())
                
                Image("Vector 5")
                    .resizable()
                    .frame(width: 25, height: 16)
                
            }
            .foregroundStyle(.white)
            .frame(width: width, height: height)
        }
    }
}

// TODO: Make Dynamic Custom Buttons Instead of Making Each Button

struct CustomButtonLightGreen: View {
    
    @State var title: String
    
    @State var width: CGFloat
    
    @State var fontType: FontsType
    
    @State var size: CGFloat
    
    @State var action: () -> Void
    
    var body: some View {
        
        Button(action: action) {
            ZStack {
               Color("button linear 2")
                .clipShape(RoundedRectangle(cornerRadius: 32))
                
                Text(title)
                    .font(.customFont(name: .inter, type: fontType, size: size))
                
            }
            .foregroundStyle(.white)
            .frame(width: width, height: 56)
        }
    }
}


#Preview {
    VStack {
        CustomButton(title: "Custom Button", width: 375, action: {})
        
        CircleButton(title: "Circle Button", width: 375, height: 50, action: {})
        
        CustomButtonLightGreen(title: "CustomButtonLightGreen", width: 375, fontType: .regular, size: 14, action: {})
        
        CustomButtonLightGreen(title: "CustomButtonLightGreenBold", width: 375, fontType: .bold, size: 16, action: {})
        
        CustomButtonLightGreen(title: "CustomBorderButton", width: 375, fontType: .light, size: 14, action: {})
    }
}
