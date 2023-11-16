//
//  OTPView.swift
//  junxApp
//
//  Created by Hamza Hashmi on 22/10/2023.
//

import SwiftUI

struct OTPView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var onboardingVM: OnboardingViewModel
    @State var geometry: GeometryProxy
    
    @FocusState private var focusedTextField: Int?
    
    @State var code1 = ""
    @State var code2 = ""
    @State var code3 = ""
    @State var code4 = ""
    
    @State var toolbarVisibility: Visibility
    
    var body: some View {
        
        ZStack {
            
            // Background
            WhiteBackground()
            
            // Content
            VStack(spacing: 0) {
                
                if toolbarVisibility == .hidden {
                    Image("text+image logo")
                        .padding(.top, 34)
                }
                
                Text("00:24")
                    .font(.customFont(name: .manuale, type: .semiBold, size: 24))
                    .padding([.horizontal, .top], 25)
                    .padding(.bottom, 20)
                
                Text("Type the verification code \nwe’ve sent you")
                    .font(.customFont(name: .inter, type: .regular, size: 14))
                    .padding(.horizontal, 40)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(Color("70-black"))
                
                
                HStack(spacing: 24) {
                    
                    TextFieldOTP(code: $code1)
                    
                    TextFieldOTP(code: $code2)
                    
                    TextFieldOTP(code: $code3)
                    
                    TextFieldOTP(code: $code4)
                }
                .padding(.top, 67)
                
                Spacer()
                
                KeyboardView { key in
                    keyPressed(key: key)
                }
                
                Button(action: {
                    
                }, label: {
                    Text("Send Again")
                })
                .padding(.top, 54)
                .padding(.bottom, geometry.safeAreaInsets.bottom)
                .foregroundStyle(Color(hexString: "ED6EF7"))
            }
            
            tintBackground()
            
            VStack(spacing:0) {
                Spacer()
                RoundedRectangle(cornerRadius: 30)
                    .foregroundStyle(.cardBg)
                    .frame(width: geometry.size.width - 40,height: 388)
                
                    .overlay(
                        VStack{
                            
                            Image("Circlesuccess")
                                .resizable()
                                .frame(width: 140,height: 140)
                                .padding(.top,30)
                            
                           
                           
                            
                            HStack {
                                Text("You’re Verified")
                                    .font(.customFont(name: .manuale, type: .semiBold, size: 24))
                                    .foregroundStyle(Color("text-main-2"))
                                
                               
                            }.frame(height: 34)
                           
                            HStack{
                                Text("Complete your profile to start matching.")
                                    .font(.customFont(name: .inter, type: .regular, size: 14))
                                    .foregroundStyle( Color("70-black"))
                                    .multilineTextAlignment(.center)
                            }.padding(.horizontal,30)
                                .padding(.top,5)
                            
                            
                            
                            
                            Spacer()
                            
                            CustomButton(title: "Continue", width: 295, action: {
                                
                            }).padding(.bottom,25)
                            
                           
                        }
                    )
                    
                
                Spacer()
            }.padding(.bottom,80)
            
        }
        .frame(width: geometry.size.width, height: geometry.size.height)
        .navigationTitle("Registration")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(toolbarVisibility, for: .navigationBar)
        .toolbar(content: {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss.callAsFunction()
                } label: {
                    Image("Back")
                }
            }
        })
    }

    func keyPressed(key: String) {
        if key == "x" {
            if !code4.isEmpty {
                code4 = ""
            }
            else if !code3.isEmpty {
                code3 = ""
            }
            else if !code2.isEmpty {
                code2 = ""
            }
            else if !code1.isEmpty {
                code1 = ""
            }
        }
        else {
            if code1.isEmpty {
                code1 = key
            }
            else if code2.isEmpty {
                code2 = key
            }
            else if code3.isEmpty {
                code3 = key
            }
            else if code4.isEmpty {
                code4 = key
            }
            
        }
    }
}

#Preview {
    NavigationView {
        GeometryReader { geometry in
            OTPView(onboardingVM: OnboardingViewModel(), geometry: geometry, toolbarVisibility: .visible)
        }
    }
}
