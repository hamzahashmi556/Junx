//
//  TextFieldBordered.swift
//  junxApp
//
//  Created by Hamza Hashmi on 22/10/2023.
//

import SwiftUI

struct TextFieldBordered: View {
    
    @Binding var text: String
    
    @State var title: String
    
    @State var color: Color
    
    @State var isSecureField: Bool
    
    @State var width: CGFloat
    
    var body: some View {
        
        ZStack {
            
            // Text Field
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .stroke()
                    .foregroundStyle(.tfBorder)
                
                if isSecureField {
                    SecureField("", text: $text)
                        .frame(height: width * 0.2)
                        .padding(.leading)
                }
                else {
                    TextField("", text: $text)
                        .frame(height: width * 0.2)
                        .padding(.leading)
                        .font(.customFont(name: .inter, type: .regular, size: 16))
                }
            }
            .frame(width: width, height: width * 0.2)
            
            // Password Title
            VStack {
                
                HStack {
                    
                    Text(title)
                        .padding(.horizontal)
                        .background(color)
                        .foregroundStyle(.textSecondary)
                        .font(.customFont(name: .inter, type: .regular, size: 14))
                    
                    Spacer()
                }
                .padding(.leading)
                
                Spacer()
            }

        }
        .frame(width: width, height: width * 0.25)

    }
}

#Preview {
    TextFieldBordered(text: .constant("text"), title: "Password", color: .tfBorder, isSecureField: true, width: 375)
}
