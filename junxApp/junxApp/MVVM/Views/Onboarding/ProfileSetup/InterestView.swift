//
//  InterestView.swift
//  junxApp
//
//  Created by apple on 16/11/2023.
//

import SwiftUI

struct InterestView: View {
    @ObservedObject var onboardingVM: OnboardingViewModel
    @State var geometry: GeometryProxy
    @State var toolbarVisibility: Visibility
    @State var email = ""
    @State var wrongUser: Bool = true
    var body: some View {
        
        
        
        ZStack {
            
            WhiteBackground()
            
            VStack {
                
                VStack(spacing: 18, content: {
                    
                    Text("You’re Interested In?")
                        .padding(.top, 35)
                        .font(.customFont(name: .manuale, type: .semiBold, size: 24))
                        .foregroundStyle(.textMain)
                    
                  
                       
                    
                })
                .padding(.horizontal, 25)
                
                
                
                VStack(spacing: 15) {
                    
                    SelectionCard(title: "Woman", selected: .constant(false))
                    SelectionCard(title: "Man", selected: .constant(true))
                    SelectionCard(title: "Non-Binary", selected: .constant(false))
                    SelectionCard(title: "Trans", selected: .constant(false))
                    
                   
                    

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
            InterestView(onboardingVM: OnboardingViewModel(), geometry: geo, toolbarVisibility: .visible)
        }
    }
}
