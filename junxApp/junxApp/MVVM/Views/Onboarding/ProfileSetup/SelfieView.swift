//
//  SelfieView.swift
//  junxApp
//
//  Created by Hamza Hashmi on 17/11/2023.
//

import SwiftUI

struct SelfieView: View {
    
    
    var body: some View {
        VStack(spacing: 0) {
            
            NavigationBar(title: "Take a Selfie",
                          rightItems: [.init(image: .tetrah)],
                          leftItems: [.init(image: .back)],
                          rightPadding: 24,
                          leftPadding: 24,
                          height: 24)
            .padding(.top, 27)
            
            HStack(alignment: .top) {
                
                VStack(alignment: .leading, spacing: 2) {
                    suggestion(text: "Find a well-lit area")
                    suggestion(text: "Face the camera directly")
                    suggestion(text: "Keep a neutral expression")
                }
                
                VStack(alignment: .leading, spacing: 2) {
                    suggestion(text: "Avoid Shadows")
                    suggestion(text: "Remove any glasses")
                }
            }
            .padding(.top, 42)
            .padding(.horizontal, 16)
            
            Image(.men)
                .resizable()
                .scaledToFill()
                .frame(height: 416)
                .clipShape(RoundedRectangle(cornerRadius: 32))
                .padding(.horizontal, 25)
                .padding(.top, 20)
            
            Spacer()
            
            Button {
                
            } label: {
                Image(.shot)
            }
        }
    }
    
    func suggestion(text: String) -> some View {
        Text(text)
            .font(.customFont(name: .inter, type: .regular, size: 14))
            .padding(.vertical, 6)
            .padding(.horizontal, 10)
            .background(Color.lightgrayGreen)
            .clipShape(RoundedRectangle(cornerRadius: 25.0))
    }
}

#Preview {
    SelfieView()
}
