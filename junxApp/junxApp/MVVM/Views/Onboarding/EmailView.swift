//
//  EmailView.swift
//  junxApp
//
//  Created by Hamza Hashmi on 22/10/2023.
//

import SwiftUI

struct EmailView: View {
    
    @ObservedObject var onboardingVM: OnboardingViewModel
    @State var geometry: GeometryProxy
    @State var toolbarVisibility: Visibility
    @State var email = ""
    
    var body: some View {
        
        
        
        ZStack {
            
            WhiteBackground()
            
            VStack {
                
                VStack(spacing: 18, content: {
                    
                    Text("Mail Address Here")
                        .padding(.top, 35)
                        .font(.customFont(name: .manuale, type: .semiBold, size: 24))
                        .foregroundStyle(.textMain)
                    
                  
                        Text("Enter the email address associated with your account.")
                            .font(.customFont(name: .inter, type: .regular, size: 14))
                            .multilineTextAlignment(.center)
                            .foregroundStyle(Color("70-black"))
                    
                })
                .padding(.horizontal, 25)
                
                let width = geometry.size.width - 80
                
                VStack(spacing: 16) {
                    
                    TextFieldBordered(text: $email, title: "Email", color: .tfBorder2, isSecureField: false, width: width)
                }
                .padding(.top, 35)
                
                Spacer()
                
                CustomButton(title: "Continue", width: geometry.size.width - 95) {
                    
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(toolbarVisibility, for: .navigationBar)
        .toolbar(content: {
            ToolbarItem(placement: .topBarLeading) {
                Image("Back")
            }
            ToolbarItem(placement: .principal) {
                Text("Registration")
                    .font(.customFont(name: .SFPRO, type: .medium, size: 16))
                
            }
            
            
            
        })
        
    }
}

#Preview {
    NavigationView {
        GeometryReader { geometry in
            EmailView(onboardingVM: OnboardingViewModel(), geometry: geometry, toolbarVisibility: .visible)
        }
    }
}
