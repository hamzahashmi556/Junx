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
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.textMain)
                    .padding(.bottom,30)
                
               
               
                let width = geometry.size.width - 95
                
                VStack(spacing: 13) {
                    CustomButtonWithLogo(title: "Login with Google", imageName: "google 1", width: 295, action: {})
                    
                    CustomButtonWithLogo(title: "Login with Apple", imageName: "apple-logo 1", width: 295, action: {})
                    
                    HStack{
                        RoundedRectangle(cornerRadius: 0)
                            .foregroundStyle(.borderline)
                            .frame(width: 120,height: 1)
                        Text("OR")
                            .font(.customFont(name: .inter, type: .semiBold, size: 7.95))
                            .foregroundStyle(.textsecondary5)
                        RoundedRectangle(cornerRadius: 0)
                            .foregroundStyle(.borderline)
                            .frame(width: 120,height: 1)
                    }.padding(.vertical,5)
                    
                    CustomButtonLightGreen(title: "Login with Email/Phone", width: 295, fontType: .bold, size: 16, action: {
                        
                    })
                   
                }
                .padding(.bottom, 10)
                
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
