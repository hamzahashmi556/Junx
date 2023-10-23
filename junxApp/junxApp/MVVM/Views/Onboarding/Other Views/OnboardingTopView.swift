//
//  OnboardingTopView.swift
//  junxApp
//
//  Created by Hamza Hashmi on 22/10/2023.
//

import SwiftUI

struct OnboardingTopView: View {
    
    @State var title: String
    
    @State var subTitle: String
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            Image("text+image logo")
                .padding(.top, 35)
            
            VStack(spacing: 18, content: {
                
                Text(title)
                    .padding(.top, 35)
                    .font(.customFont(name: .manuale, type: .semiBold, size: 24))
                    .foregroundStyle(.textMain)
                
                if !subTitle.isEmpty {
                    Text(subTitle)
                        .font(.customFont(name: .inter, type: .regular, size: 14))
                        .multilineTextAlignment(.center)
                        .padding(.top, 18)
                        .foregroundStyle(.textSecondary)
                }
            })
            .padding(.horizontal, 25)
        }
    }
}

#Preview {
    OnboardingTopView(title: "Enter New Password", subTitle: "Your new password must be different from previously used password")
}
