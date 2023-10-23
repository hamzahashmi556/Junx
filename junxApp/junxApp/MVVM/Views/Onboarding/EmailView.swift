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
    
    @State var email = ""
    
    var body: some View {
        
        
        
        ZStack {
            
            WhiteBackground()
            
            VStack {
                
                OnboardingTopView(title: "Mail Address Here", subTitle: "Enter the email address associated \nwith your account.")
                
                let width = geometry.size.width - 80
                
                VStack(spacing: 16) {
                    
                    TextFieldBordered(text: $email, title: "Email", color: .tfBorder2, isSecureField: true, width: width)
                }
                .padding(.top, 75)
                
                Spacer()
                
                CustomButton(title: "Continue", width: geometry.size.width - 95) {
                    
                }
            }
        }
        
    }
}

#Preview {
    GeometryReader { geometry in
        EmailView(onboardingVM: OnboardingViewModel(), geometry: geometry)
    }
}
