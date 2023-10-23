//
//  LoginView.swift
//  junxApp
//
//  Created by Hamza Hashmi on 22/10/2023.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var onboardingVM: OnboardingViewModel
    @State var geometry: GeometryProxy
    
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        
        
        
        ZStack {
            
            WhiteBackground()
            
            VStack {
                
                OnboardingTopView(title: "Welcome Back!", subTitle: "")
                
                let width = geometry.size.width - 80
                
                VStack(spacing: 16) {
                    
                    TextFieldBordered(text: $email, title: "Email", color: .tfBorder2, isSecureField: false, width: width)
                    
                    TextFieldBordered(text: $password, title: "Password", color: .tfBorder3, isSecureField: true, width: width)
                    
                }
                .padding(.top, 52)
                
                HStack {
                    
                    Spacer()
                    
                    Button {
                        onboardingVM.isPresentedForgotPassword = true
                    } label: {
                        Text("Forgot Password")
                            .foregroundStyle(Color(hexString: "ED6EF7"))
                            .font(.customFont(name: .inter, type: .medium, size: 16))
                    }
                }
                .padding(.trailing, 33)
                
                Spacer()
                
                CustomButton(title: "Continue", width: geometry.size.width - 95) {
                    //                        onboardingVM
                }
            }
            
        }
    }
}

#Preview {
    GeometryReader { geometry in
        LoginView(onboardingVM: OnboardingViewModel(), geometry: geometry)
    }
}
