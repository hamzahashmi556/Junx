//
//  WelcomeView.swift
//  junxApp
//
//  Created by Hamza Hashmi on 21/10/2023.
//

import SwiftUI

struct WelcomeView: View {
    
    @State var titles = ["Welcome \nto junX",
                         "Discover Your \nPerfect Match",
                         "Your Safety, \nOur Priority"]
    
    @State var subTitles = ["Where Connections Blossom.",
                            "We Tailor Matches for You.",
                            "Secure Dating Guaranteed."]
    
    @State var tag: Int
    
    var body: some View {
        
        ZStack {
            
            LinearGradient(colors: [.mainBackgroundLinear1, .mainBackgroundLinear2],
                           startPoint: .top,
                           endPoint: .bottom)
            .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                Spacer(minLength: 20)
                
                // Title
                HStack {
                    
                    Text(titles[tag])
                        .multilineTextAlignment(.leading)
                        .font(.customFont(name: .manuale, type: .semiBold, size: 45))
                        
                    
                    Spacer()
                }
                .padding(.horizontal, 50)
                
                // Subtitle
                HStack {
                    
                    Text(subTitles[tag])
                        .font(.customFont(name: .inter, type: .semiBold, size: 14))
                    
                    Spacer()
                }
                .padding(.leading, 50)
                .padding(.top)
                
                Image("onboarding vector")
                    .padding(.vertical, 40)
                
                Text("Join a vibrant community of singles looking for love. Swipe right to start your journey.")
                    .padding(.horizontal, 20)
                    .font(.customFont(name: .inter, type: .medium, size: 14))
                    .multilineTextAlignment(.center)
                
                
                Spacer()
                Spacer()
            }
            .foregroundStyle(.white)
        }
    }
}

#Preview {
    
    TabView {
        WelcomeView(tag: 0)
            .tag(0)
        
        WelcomeView(tag: 1)
            .tag(1)
        
        WelcomeView(tag: 2)
            .tag(2)
    }
    .tabViewStyle(.page(indexDisplayMode: .always))
    .ignoresSafeArea()
}
