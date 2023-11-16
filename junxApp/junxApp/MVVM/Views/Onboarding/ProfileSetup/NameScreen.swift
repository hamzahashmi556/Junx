//
//  NameScreen.swift
//  junxApp
//
//  Created by apple on 16/11/2023.
//

import SwiftUI

struct NameScreen: View {
    @ObservedObject var onboardingVM: OnboardingViewModel
    @State var geometry: GeometryProxy
    @State var toolbarVisibility: Visibility
    @State var email = ""
    
    var body: some View {
        
        
        
        ZStack {
            
            WhiteBackground()
            
            VStack {
                
                VStack(spacing: 18, content: {
                    
                    Text("Let’s Get Acquainted!")
                        .padding(.top, 35)
                        .font(.customFont(name: .manuale, type: .semiBold, size: 24))
                        .foregroundStyle(.textMain)
                    
                  
                       
                    
                })
                .padding(.horizontal, 25)
                
                let width = geometry.size.width - 80
                
                VStack(spacing: 16) {
                    
                    ProfileTextField(title: .constant(""), placeHolder: "First Name")
                    
                    ProfileTextField(title: .constant(""), placeHolder: "Last Name")
                    
                    
                }
                .padding(.top, 35)
                
                Spacer()
                
                CustomButton(title: "Continue", width: geometry.size.width - 95) {
                    
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(toolbarVisibility, for: .navigationBar)
        .toolbar(content: {
            ToolbarItem(placement: .topBarLeading) {
                Image("Back")
            }
            ToolbarItem(placement: .principal) {
                Text("Profile Set Up")
                    .font(.customFont(name: .SFPRO, type: .regular, size: 16))
                
            }
            
            
            
        })
        
    }
}

#Preview {
    NavigationView {
        GeometryReader { geo in
            NameScreen(onboardingVM: OnboardingViewModel(), geometry: geo, toolbarVisibility: .visible)
        }
    }
   
}
