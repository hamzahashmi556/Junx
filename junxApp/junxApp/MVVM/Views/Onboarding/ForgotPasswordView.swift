//
//  ForgotPasswordView.swift
//  junxApp
//
//  Created by Hamza Hashmi on 22/10/2023.
//

import SwiftUI

struct ForgotPasswordView: View {
    
    @ObservedObject var onboardingVM: OnboardingViewModel
    @State var geometry: GeometryProxy
    
    @State private var password = ""
    @State private var confirmPassword = ""
    
    var body: some View {
        
        ZStack {
            
            WhiteBackground()
            
            VStack {
                
                OnboardingTopView(title: "Enter New Password", subTitle: "Your new password must be different from previously used password")
                
                let width = geometry.size.width - 80
                
                VStack(spacing: 16) {
                    
                    TextFieldBordered(text: $password, title: "Password", color: .tfBorder2, isSecureField: true, width: width)
                    
                    TextFieldBordered(text: $confirmPassword, title: "Confirm Password", color: .tfBorder3, isSecureField: true, width: width)
                }
                .padding(.top, 63)
                
                Spacer()
                
                CustomButton(title: "Continue", width: geometry.size.width - 95) {
                    onboardingVM.isPresentedEmailOTP = true
                }
            }
        }
        
    }
}

#Preview {
    GeometryReader { geometry in
        ForgotPasswordView(onboardingVM: OnboardingViewModel(), geometry: geometry)
    }
}
