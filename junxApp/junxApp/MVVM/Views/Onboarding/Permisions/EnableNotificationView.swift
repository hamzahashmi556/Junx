//
//  EnableNotificationView.swift
//  junxApp
//
//  Created by apple on 16/11/2023.
//

import SwiftUI

struct EnableNotificationView: View {
    @ObservedObject var onboardingVM: OnboardingViewModel
    @State var geometry: GeometryProxy
    @State var toolbarVisibility: Visibility
    @State var email = ""
    @State var wrongUser: Bool = true
    var body: some View {
        
        
        
        ZStack {
            
            WhiteBackground()
            
            VStack {
                
               
               
                
                
                
                VStack(spacing: 15) {
                    Image("notifications")
                  
                    VStack{
                        Text("Enable notification’s")
                            
                            .font(.customFont(name: .manuale, type: .semiBold, size: 24))
                            .foregroundStyle(.textMain)
                            .padding(.bottom,10)
                        Text("Get push-notification when you get the match or receive a message.")
                            .font(.customFont(name: .inter, type: .regular, size: 14))
                            .foregroundStyle(Color("70-black"))
                            .multilineTextAlignment(.center)
                            .padding(.horizontal,50)
                            
                            
                    }.padding(.top,50)
                 
                    
                    

                    Spacer()
                }
                .padding(.top, 65)
                
                Spacer()
                
                CustomButton(title: "I want to be notified", width: 295) {
                    
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(toolbarVisibility, for: .navigationBar)
        .toolbar(content: {
           
            ToolbarItem(placement: .topBarTrailing) {
                Text("Skip")
                    .font(.customFont(name: .skModernist, type: .bold, size: 16))
                    .foregroundStyle(.blackwhite)
                    .padding(.trailing,25)
                
            }
            
            
            
        })
        
    }
}

#Preview {
    NavigationView {
        GeometryReader { geo in
            EnableNotificationView(onboardingVM: OnboardingViewModel(), geometry: geo, toolbarVisibility: .visible)
        }
    }
    
}
