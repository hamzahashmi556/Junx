//
//  ConfirmDeleteScreen.swift
//  junxApp
//
//  Created by apple on 05/11/2023.
//

import SwiftUI

struct ConfirmDeleteScreen: View {
    @State var geometry: GeometryProxy
    var body: some View {
        ZStack{
            WhiteBackground()
            VStack(spacing: 0) {
                
                // Title
                HStack {
                    Text("Welcome to Safety")
                        .font(.customFont(name: .manuale, type: .semiBold, size: 24))
                        .foregroundStyle(Color("text-main-2"))
                    
                    //                        Spacer()
                }
                .padding(.top, 50)
                
                //                    Spacer()
                
                // Logo
                Image("JunX text")
                    .padding(.vertical, 113)
                
                //                    Spacer()
                
                Text("Ensure Safe Dating!")
                    .font(.customFont(name: .inter, type: .semiBold, size: 14))
                    .foregroundStyle(Color("424753"))
                    .multilineTextAlignment(.center)
                
                Group{
                    
                    Text("Check-In.")
                        .font(.customFont(name: .inter, type: .semiBold, size: 14))
                        .foregroundStyle(Color("70-black"))// Set the text to be bold
                    + Text(" Enhance your Safety during your date with this feature.")
                        .font(.customFont(name: .inter, type: .regular, size: 14))
                        .foregroundStyle(Color("70-black"))
                        
               
                }.padding(.horizontal, 50)
                    .padding(.top, 10)
                    .multilineTextAlignment(.center)
                
                  Spacer()
                
                CustomButton(title: "Continue", width: geometry.size.width - 95) {
                    
                }
                .padding(.bottom, 10)
                
                CustomButtonLightGreen(title: "Cancel", width: geometry.size.width - 95, fontType: .bold, size: 16) {
                    
                }
                .padding(.bottom, 30)
                
                // Buttons
                
            }
        }
        .frame(width: geometry.size.width)
    }
}

#Preview {
    GeometryReader { geometry in
        ConfirmDeleteScreen(geometry: geometry)
    }
}
