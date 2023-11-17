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
            
            VStack(spacing: 0) {
                
                Text("Let’s Get Acquainted!")
                    .font(.customFont(name: .manuale, type: .semiBold, size: 24))
                    .padding(.top, 28)
                    .padding(.horizontal, 25)
                    .foregroundStyle(.textMain)
                
                VStack(spacing: 10) {
                    
                    ProfileTextField(title: .constant(""), placeHolder: "First Name")
                    
                    ProfileTextField(title: .constant(""), placeHolder: "Last Name")
                    
                    DatePickerView()
                }
                .padding(.top, 52)
                
                HStack {
                    
                    RoundedRectangle(cornerRadius: 6)
                        .stroke()
                        .frame(width: 19, height: 19)
                    
                    Text("By clicking here, I admit I am at least")
                        .font(.customFont(name: .urbanist, type: .medium, size: 11))
                        .foregroundStyle(.textMain)
                    +
                    Text(" 18 years of age or older")
                        .font(.customFont(name: .urbanist, type: .semiBold, size: 11))
                        .foregroundStyle(.greenwithblack)
                    
                    Spacer()
                    
                }
                .padding(.top, 20)
                .padding(.horizontal, 57)
                
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
                Text("Registration")
                    .font(.customFont(name: .SFPRO, type: .medium, size: 16))
            }
        })
    }
    
    func DatePickerView() -> some View {
        ZStack {
            
            HStack(spacing: 0) {
                
                Text("1")
                    .font(.customFont(name: .inter, type: .regular, size: 16))
                    .frame(width: 70)
                
                Rectangle()
                    .frame(width: 3, height: 54)
                    .foregroundStyle(.datepickerBorder)
                
                Text("January")
                    .font(.customFont(name: .inter, type: .regular, size: 16))
                    .frame(maxWidth: .infinity)
                
                Rectangle()
                    .frame(width: 3, height: 54)
                    .foregroundStyle(.datepickerBorder)

                Text("2023")
                    .font(.customFont(name: .inter, type: .regular, size: 16))
                    .frame(width: 70)
            }
        }
        .frame(width: UIScreen.main.bounds.width - 114, height: 54)
        .background {
            RoundedRectangle(cornerRadius: 16)
                .stroke(lineWidth: 2.5)
                .foregroundStyle(.datepickerBorder)
        }
    }
}

#Preview {
    NavigationView {
        GeometryReader { geo in
            NameScreen(onboardingVM: OnboardingViewModel(), geometry: geo, toolbarVisibility: .visible)
        }
    }
   
}
