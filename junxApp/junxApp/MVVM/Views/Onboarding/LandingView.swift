//
//  LandingView.swift
//  junxApp
//
//  Created by Hamza Hashmi on 22/10/2023.
//

import SwiftUI

struct LandingView: View {
    
    @ObservedObject var onboardingVM: OnboardingViewModel
    @State var geometry: GeometryProxy
    
    var body: some View {
        
        ZStack {
            
            WhiteBackground()
            
            VStack(spacing: 0) {
                
                // Title
                HStack {
                    Text("Let’s Dive In")
                        .font(.customFont(name: .manuale, type: .semiBold, size: 45))
                    
                    //                        Spacer()
                }
                .padding(.top, 50)
                
                //                    Spacer()
                
                // Logo
                Image("image logo")
                    .padding(.vertical, 113)
                
                //                    Spacer()
                
                Text("Start Your Dating \nAdventure")
                    .font(.customFont(name: .manuale, type: .semiBold, size: 24))
                    .multilineTextAlignment(.center)
                
                Text("Sign up now to meet fantastic people in your area. It's time to create your own love story.")
                    .font(.customFont(name: .inter, type: .regular, size: 14))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 50)
                    .padding(.top, 10)
                //                        .padding(.bottom, 80)
                
                
                Spacer()
                
                // Buttons
                VStack {
                    
                    let width = geometry.size.width - 95
                    
                    CustomButton(title: "Sign In", width: width) {
                        onboardingVM.isPresentedSelectLogin = true
                    }
                    CustomButtonLightGreen(title: "Sign Up", width: 295, fontType: .bold, size: 16, action: {
                        onboardingVM.isPresentedLogin = true
                    })
//                    CustomButtonLightGreen(title: "Sign in", width: width) {
//                        onboardingVM.isPresentedLogin = true
//                    }
                }
            }
        }
        .frame(width: geometry.size.width)
    }
}

#Preview {
    GeometryReader { geometry in
        LandingView(onboardingVM: OnboardingViewModel(), geometry: geometry)
    }
}
