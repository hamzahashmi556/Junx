//
//  LoginView.swift
//  junxApp
//
//  Created by Hamza Hashmi on 22/10/2023.
//

import SwiftUI

struct LoginView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var onboardingVM: OnboardingViewModel
    @State var geometry: GeometryProxy
    
    @State var email = ""
    @State var password = ""
    @State var toolbarVisibility: Visibility
    var body: some View {
        
        
        
        ZStack {
            
            WhiteBackground()
            
            VStack {
                
                Text("Welcome Back!")
                    .font(.customFont(name: .manuale, type: .semiBold, size: 24))
                    .padding([.horizontal, .top], 25)
                    .padding(.bottom, 12)
                    .foregroundStyle(.textMain)
                
                
                let width = geometry.size.width - 80
                
                VStack(spacing: 14) {
                    
                    TextFieldBordered(text: $email, title: "Email", color: .tfBorder2, isSecureField: false, width: width)
                    
                    TextFieldBordered(text: $password, title: "Password", color: .tfBorder3, isSecureField: true, width: width)
                    
                }.padding(.top,30)
               
                
                HStack {
                    Image("Rectangle 4")
                    Text("Remember Password")
                        .font(.customFont(name: .inter, type: .regular, size: 14))
                        .multilineTextAlignment(.center)
                        .foregroundStyle(Color("1E2940"))
                    Spacer()
                    
                    Button {
                        onboardingVM.isPresentedForgotPassword = true
                    } label: {
                        Text("Forgot Password?")
                            .font(.customFont(name: .urbanist, type: .semiBold, size: 14))
                            .foregroundStyle(.buttonLinear2)
                    }
                }.padding(.horizontal,40)
                    .padding(.top,5)
                
                
                Spacer()
                
                CustomButton(title: "Continue", width: 295) {
                    //                        onboardingVM
                }.padding(.bottom)
            }
            
        }
        .frame(width: geometry.size.width, height: geometry.size.height)
        .toolbar(toolbarVisibility, for: .navigationBar)
        .toolbar(content: {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss.callAsFunction()
                } label: {
                    Image("Back")
                }
            }
            ToolbarItem(placement: .principal) {
                Text("Registration")
                    .font(.customFont(name: .SFPRO, type: .regular, size: 16))
                
            }
        })
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $onboardingVM.isShowLoginOption, content: {
            LoginBottomSheet(homeVM: onboardingVM, geometry: geometry)
        })
        
        if onboardingVM.isShowLoginOption {
            Color.black.opacity(0.5).ignoresSafeArea()
        }
    }
}

#Preview {
    NavigationView {
        GeometryReader { geometry in
            LoginView(onboardingVM: OnboardingViewModel(), geometry: geometry, toolbarVisibility: .visible)
        }
    }
}


struct LoginBottomSheet: View {
    
    @ObservedObject var homeVM: OnboardingViewModel
    @State var geometry: GeometryProxy
    var body: some View {
        ZStack{
//            WhiteBackground()
            VStack(spacing: 0) {
                HStack{
                   
                    Group{
                        Image("messages")
                            .resizable()
                            .frame(width: 36,height: 36)
                    }.frame(width: 40,height: 40)
                    
                    
                    Text("Password reset via SMS")
                        .font(.customFont(name: .inter, type: .regular, size: 16))
                        .foregroundStyle(Color("0C212C"))
                    Spacer()
                    Circle()
                        .frame(width: 40,height: 40)
                        .foregroundStyle(.buttonLinear2)
                        .overlay(
                           Image("chevron-left")
                            .resizable()
                            .frame(width: 24,height: 24)
                        ).padding(.leading,30)
                   
                }
                .frame(width: geometry.size.width - 70,height: 40)
                .padding(.top,25)
                
               
                
                HStack{
                    Group{
                        Image("mail 2")
                            .resizable()
                            .frame(width: 40,height: 40)
                    }.frame(width: 40,height: 40)
                   
                        
                    Text("Password reset via Email")
                        .font(.customFont(name: .inter, type: .regular, size: 16))
                        .foregroundStyle(Color("0C212C"))
                    Spacer()
                    Circle()
                        .frame(width: 40,height: 40)
                        .foregroundStyle(.buttonLinear2)
                        .overlay(
                           Image("chevron-left")
                            .resizable()
                            .frame(width: 24,height: 24)
                        ).padding(.leading,30)
                  
                }.frame(width: geometry.size.width - 70,height: 40)
                    .padding(.top,25)
                   
                
            }
            
        }
        .presentationDragIndicator(.visible)
        .presentationCornerRadius(24)
        .presentationDetents([.height(148)])
        .presentationBackground(.cardBg2)
    }
}
