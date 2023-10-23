//
//  SelectLoginView.swift
//  junxApp
//
//  Created by Hamza Hashmi on 22/10/2023.
//

import SwiftUI

struct SelectLoginView: View {
    
    @ObservedObject var onboardingVM: OnboardingViewModel
    @State var geometry: GeometryProxy
    
    var body: some View {
        
        ZStack {
            
            WhiteBackground()
            
            VStack(spacing: 0) {
                
                VStack {
                    Image("couple vector")
                }
                .frame(width: geometry.size.width, height: geometry.size.width)
                
                Text("Let’s meet new people \naround you")
                    .font(.customFont(name: .manuale, type: .semiBold, size: 24))
                
                Spacer()
                
                let width = geometry.size.width - 95
                
                VStack(spacing: 16) {
                    CustomButton(title: "Login with Phone", width: width) {
                        onboardingVM.isPresentedPhoneNumber = true
                    }
                    
                    CustomButton(title: "Login with Google", width: width) {
                        onboardingVM.isPresentedLogin = true
                    }
                }
                .padding(.bottom, 30)
                
                HStack(spacing: 0) {
                    Text("Don’t have an account? ")
                        .font(.customFont(name: .inter, type: .regular, size: 14))
                        .foregroundStyle(.textMain)
                    
                    Text("Sign Up")
                        .font(.customFont(name: .inter, type: .semiBold, size: 14))
                        .foregroundStyle(.textSecondary)
                }
                //                    .opacity(0.7)
            }
            
        }
        .frame(width: geometry.size.width, height: geometry.size.height)
    }
    
}

#Preview {
    GeometryReader { geometry in
        SelectLoginView(onboardingVM: OnboardingViewModel(), geometry: geometry)
    }
}
