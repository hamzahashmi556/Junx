//
//  ForgotPasswordView.swift
//  junxApp
//
//  Created by Hamza Hashmi on 22/10/2023.
//

import SwiftUI

struct ForgotPasswordView: View {
    
    @ObservedObject var onboardingVM: OnboardingViewModel
    @State var geometry: GeometryProxy
    
    @State private var password = ""
    @State private var confirmPassword = ""
    @State var toolbarVisibility: Visibility
    @State var showSuccess: Bool = true
    var body: some View {
        
        ZStack {
            
            WhiteBackground()
            
            VStack {
                
                VStack(spacing: 18, content: {
                    
                    Text("Enter New Password")
                        .padding(.top, 35)
                        .font(.customFont(name: .manuale, type: .semiBold, size: 24))
                        .foregroundStyle(.textMain)
                    
                  
                        Text("Your new password must be different from previously used password")
                            .font(.customFont(name: .inter, type: .regular, size: 14))
                            .multilineTextAlignment(.center)
                            .foregroundStyle(Color("70-black"))
                    
                })
                .padding(.horizontal, 25)
                
                let width = geometry.size.width - 80
                
                VStack(spacing: 16) {
                    
                    TextFieldBordered(text: $password, title: "Password", color: .tfBorder2, isSecureField: true, width: width)
                    HStack {
                        Image("Rectangle 4")
                        Text("Remember Password")
                            .font(.customFont(name: .inter, type: .regular, size: 14))
                            .multilineTextAlignment(.center)
                            .foregroundStyle(Color("1E2940"))
                        
                        Spacer()
                    }.frame(width: width)
                   
                    HStack {
                        Text("*NOTE: At least 8 characters, containing a letter and a number")
                            .font(.customFont(name: .inter, type: .regular, size: 13))
                            .foregroundStyle(.EDEDED)
                        
                        Spacer()
                        
                    }.frame(width: width)
                    
                }
                .padding(.top, 63)
                
                Spacer()
                
                CustomButton(title: "Continue", width: 295) {
                    onboardingVM.isPresentedEmailOTP = true
                }
            }
            
            if showSuccess {
                tintBackground()
                
                VStack(spacing:0) {
                    Spacer()
                    RoundedRectangle(cornerRadius: 30)
                        .foregroundStyle(.cardBg)
                        .frame(width: geometry.size.width - 40,height: 385)
                    
                        .overlay(
                            VStack{
                                Image("Group 22")
                                    .resizable()
                                    .frame(width: 130,height: 140)
                                    .padding(.top,30)
                                
                               
                               
                                
                                HStack {
                                    Spacer()
                                    Text("Sign In Successful")
                                        .font(.customFont(name: .inter, type: .semiBold, size: 24))
                                        .foregroundStyle(.greenTheme)
                                        .multilineTextAlignment(.center)
                                    
                                   Spacer()
                                }.frame(width: 150)
                               
                                VStack{
                                    Text("Please wait...")
                                        .font(.customFont(name: .inter, type: .regular, size: 14))
                                        .foregroundStyle( Color("59606E"))
                                        .multilineTextAlignment(.center)
                                    
                                    Text("You will be directed to the homepage soon.")
                                        .font(.customFont(name: .inter, type: .regular, size: 14))
                                        .foregroundStyle( Color("59606E"))
                                        .multilineTextAlignment(.center)
                                }.padding(.top,10)
                                
                                
                                
                                
                                Spacer()
                                
                                Image("spinner")
                                    .resizable()
                                    .frame(width: 37,height: 37)
                                    .padding(.bottom)
                                
                                Spacer()
                            }
                        )
                        
                    
                    Spacer()
                }.padding(.bottom,80)
            }
           
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(toolbarVisibility, for: .navigationBar)
        .toolbar(content: {
            ToolbarItem(placement: .topBarLeading) {
                Image("Back")
            }
            ToolbarItem(placement: .principal) {
                Text("Registration")
                    .font(.customFont(name: .inter, type: .regular, size: 16))
                
            }
            
            
            
        })
       
        
    }
}

#Preview {
    NavigationView {
        GeometryReader { geometry in
            ForgotPasswordView(onboardingVM: OnboardingViewModel(), geometry: geometry, toolbarVisibility: .visible)
        }
    }
}
