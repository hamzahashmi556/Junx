//
//  ContentView.swift
//  junxApp
//
//  Created by Hamza Hashmi on 21/10/2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var onboardingVM = OnboardingViewModel()
    
    @StateObject var homeVM = HomeViewModel()
    
    @State var showSplash = true
    
    @State var showWelcome = true
    
    var body: some View {
            
        GeometryReader { geometry in
            ZStack {
                if showSplash {
                    SplashView()
                }
                else {
                    TabbarView(homeVM: homeVM)
                    /*
                    if onboardingVM.showWelcome {
                        TabView(selection: $onboardingVM.welcomeIndex,
                                content:  {
                            WelcomeView(tag: 0).tag(0)
                            WelcomeView(tag: 1).tag(1)
                            WelcomeView(tag: 2).tag(2)
                        })
                        .tabViewStyle(.page(indexDisplayMode: .never))
                    }
                    else {
                        LandingView(onboardingVM: onboardingVM, geometry: geometry)
                            .navigationDestination(isPresented: $onboardingVM.isPresentedSelectLogin) {
                                SelectLoginView(onboardingVM: onboardingVM, geometry: geometry).navigationBarBackButtonHidden()
                            }
                            .navigationDestination(isPresented: $onboardingVM.isPresentedPhoneNumber) {
                                PhoneNumberView(onboardingVM: onboardingVM, geometry: geometry).navigationBarBackButtonHidden()
                            }
                            .navigationDestination(isPresented: $onboardingVM.isPresentedEmailOTP) {
                                OTPView(onboardingVM: onboardingVM, geometry: geometry, toolbarVisibility: .hidden).navigationBarBackButtonHidden()
                            }
                            .navigationDestination(isPresented: $onboardingVM.isPresentedNumberOTP) {
                                OTPView(onboardingVM: onboardingVM, geometry: geometry, toolbarVisibility: .visible).navigationBarBackButtonHidden()
                            }
                            .navigationDestination(isPresented: $onboardingVM.isPresentedForgotPassword) {
                                ForgotPasswordView(onboardingVM: onboardingVM, geometry: geometry).navigationBarBackButtonHidden()
                            }
                            .navigationDestination(isPresented: $onboardingVM.isPresentedEmail) {
                                EmailView(onboardingVM: onboardingVM, geometry: geometry).navigationBarBackButtonHidden()
                            }
                            .navigationDestination(isPresented: $onboardingVM.isPresentedLogin) {
                                LoginView(onboardingVM: onboardingVM, geometry: geometry).navigationBarBackButtonHidden()
                            }
                    }
                    */
                }
            }
            .onAppear(perform: {
                Constants.size = geometry.size
                Constants.safeArea = geometry.safeAreaInsets
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    withAnimation {
                        self.showSplash = false
                    }
                }
            })
        }
    }
}

#Preview {
    ContentView()
}
