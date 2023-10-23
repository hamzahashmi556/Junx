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
                
                Text("Please enter your valid phone number. We will send you a 4-digit code to verify your account. ")
                    .font(.customFont(name: .inter, type: .regular, size: 14))
                    .padding(.horizontal, 40)
                    .multilineTextAlignment(.center)
                
                // Text Field
                ZStack {
                    
                    RoundedRectangle(cornerRadius: 16)
                        .stroke()
                        .foregroundStyle(.tfBorder)
                    
                    TextField("Number", text: $number)
                        .padding(.leading)
                        .frame(height: 60)
                    
                    HStack {
                        
                        Spacer()
                        
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
                }
                .frame(width: 255, height: 42)
                .padding(.top, 50)
                
                
                
                Spacer()
                
                CustomButton(title: "Continue", width: geometry.size.width - 95) {
                    onboardingVM.isPresentedNumberOTP = true
                }
                .padding(.bottom, 50)
            }
            
        }
        .frame(width: geometry.size.width, height: geometry.size.height)
        .navigationTitle("Registration")
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
