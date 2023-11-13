//
//  PhoneNumberView.swift
//  junxApp
//
//  Created by Hamza Hashmi on 22/10/2023.
//

import SwiftUI

struct PhoneNumberView: View {
    
    @ObservedObject var onboardingVM: OnboardingViewModel
    @State var geometry: GeometryProxy
    
    @State var number = ""
    
    var body: some View {
        
        ZStack {
            
            WhiteBackground()
            
            // Content
            VStack(spacing: 0) {
                
                Text("Enter your phone number")
                    .font(.customFont(name: .manuale, type: .semiBold, size: 24))
                    .padding([.horizontal, .top], 25)
                    .padding(.bottom, 12)
                
                HStack {
                    Spacer()
                    Text("Please enter your valid phone number. We will send you a 4-digit code to verify your account. ")
                        .font(.customFont(name: .inter, type: .regular, size: 14))
                        .foregroundStyle(Color("70-black"))
                        .padding(.horizontal, 40)
                        .multilineTextAlignment(.center)
                    Spacer()
                }.padding(.vertical,10)
                
                // Text Field
                ZStack {
                    
                    RoundedRectangle(cornerRadius: 16)
                        .stroke()
                        .foregroundStyle(.textBorder)
                    
                    
                    
                    HStack {
                        Text("+1")
                            .font(.customFont(name: .inter, type: .regular, size: 14))
                            .foregroundStyle(.textsecondary5)
                            .padding(.leading)
                        Spacer()
                        TextField("Number", text: $number)
                            .padding(.leading)
                            .frame(height: 60)
                        
                        Image(systemName: "xmark")
                            .padding(.trailing)
                            .onTapGesture {
                                self.number = ""
                            }
                    }
                    
                }
                .frame(width: geometry.size.width - 80, height: 60)
                .padding(.top, 52)
                
                // Login
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundStyle(Color(hexString: "1E8C94"))
                        .opacity(0.25)
                    
                    Text("Already have an account? Login")
                        .font(.customFont(name: .inter, type: .medium, size: 16))
                        .foregroundStyle(.textcolor8)
                }
                .frame(width: 265, height: 42)
                .padding(.top, 50)
                
                
                
                Spacer()
                HStack{
                    Spacer()
                    Text("By registering, you agree to our ")
                        .font(.customFont(name: .inter, type: .regular, size: 12))
                        .foregroundStyle(Color("333333"))
                    + Text("Terms of use")
                        .font(.customFont(name: .inter, type: .semiBold, size: 12))
                        .foregroundStyle(Color("333333"))
                    
                    + Text(" and")
                        .font(.customFont(name: .inter, type: .regular, size: 12))
                        .foregroundStyle(Color("333333"))
                    + Text(" Privacy Policies")
                        .font(.customFont(name: .inter, type: .semiBold, size: 12))
                        .foregroundStyle(Color("333333"))
                    
                    Spacer()
                }.padding(.vertical,20)
                    .padding(.horizontal)
                
                
                
                
                CustomButton(title: "Continue", width: 295) {
                    onboardingVM.isPresentedNumberOTP = true
                }
                .padding(.bottom, 25)
            }
            
        }
        .frame(width: geometry.size.width, height: geometry.size.height)
        .toolbar(content: {
            ToolbarItem(placement: .topBarLeading) {
                Image("Back")
            }
            ToolbarItem(placement: .principal) {
                Text("Registration")
                    .font(.customFont(name: .inter, type: .regular, size: 16))
                
            }
            
            
            
        })
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationView {
        GeometryReader(content: { geometry in
            PhoneNumberView(onboardingVM: OnboardingViewModel(), geometry: geometry)
        })
    }
    
}
