//
//  AccessCameraView.swift
//  junxApp
//
//  Created by apple on 16/11/2023.
//

import SwiftUI

struct AccessCameraView: View {
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
                    
                    Image("camera")
                    VStack{
                        Text("Access Camera")
                            
                            .font(.customFont(name: .manuale, type: .semiBold, size: 24))
                            .foregroundStyle(.textMain)
                            .padding(.bottom,10)
                        Text("Enable access to camera to take a selfie for verification.")
                            .font(.customFont(name: .inter, type: .regular, size: 14))
                            .foregroundStyle(Color("70-black"))
                            .multilineTextAlignment(.center)
                            .padding(.horizontal,50)
                            
                    }.padding(.top,80)
                 
                    
                    

                    Spacer()
                }
                .padding(.top, 65)
                
                Spacer()
                
                CustomButton(title: "Enable Access", width: 295) {
                    
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
        .sheet(isPresented: $onboardingVM.verificationsheet, content: {
            VerificationBottomSheet(homeVM: onboardingVM)
        })
        
    }
}

#Preview {
    NavigationView {
        GeometryReader { geo in
            AccessCameraView(onboardingVM: OnboardingViewModel(), geometry: geo, toolbarVisibility: .visible)
        }
    }
}


struct VerificationBottomSheet: View {
    
    @ObservedObject var homeVM: OnboardingViewModel
    
    var body: some View {
        ZStack{
//            WhiteBackground()
            VStack(spacing: 0) {
                
                HStack {
                    Spacer()
                    Text("Verify Your Profile to Send a Message")
                        .font(.customFont(name: .manuale, type: .regular, size: 20))
                    
                    Spacer()
                }
                .padding(.horizontal, 25)
                .padding(.top,30)
                
                Image(.hey)
                   .padding(.vertical,20)
                
                Text("Help us keep junX safe and honest, and help others know you’re real. Verified users receive up to 198% more matches.\n We’ll only use your one-time selfie to confirm you’re you, so it doesn’t have to be your best!")
                    .font(.customFont(name: .inter, type: .light, size: 14))
                    .foregroundStyle(Color("text-secondary-4"))
                    .padding(.horizontal, 25)
                    .padding(.bottom, 10)
                    .multilineTextAlignment(.center)
                    
                
                   Spacer()
               
                    CustomButton(title: "Continue", width: 295, action: {
                        
                    }).padding(.bottom)
                    
                   
                
                  
               
                    
               
            }
            
        }
        .presentationDragIndicator(.visible)
        .presentationCornerRadius(24)
        .presentationDetents([.height(349)])
        .presentationBackground(.cardBg2)
    }
}
