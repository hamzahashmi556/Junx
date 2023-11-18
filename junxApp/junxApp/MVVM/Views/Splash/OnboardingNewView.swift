//
//  OnboardingNewView.swift
//  junxApp
//
//  Created by apple on 18/11/2023.
//

import SwiftUI

struct OnboardingNewView: View {
    var body: some View {
        ZStack {
            
            
            LinearGradient(colors: [.mainBackgroundLinear1, .mainBackgroundLinear2],
                           startPoint: .top,
                           endPoint: .bottom)
            .ignoresSafeArea()
            
            Image("Wave-circle")
            VStack{
                Image("text logo")
                Text("Where Connections Blossom.")
                    .font(.customFont(name: .inter, type: .semiBold, size: 14))
                    .multilineTextAlignment(.center)
                    .foregroundStyle(Color.whiteonly)
                    .padding(.top,5)
            }
            
            
        }
    }
}

#Preview {
    OnboardingNewView()
}
