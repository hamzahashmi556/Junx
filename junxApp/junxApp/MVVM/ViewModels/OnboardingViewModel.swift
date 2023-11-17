//
//  OnboardingViewModel.swift
//  junxApp
//
//  Created by Hamza Hashmi on 23/10/2023.
//

import Foundation

class OnboardingViewModel: ObservableObject {
    
    
    @Published var welcomeIndex = 0 {
        didSet {
            if welcomeIndex == 2 {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.showWelcome = false
                }
            }
        }
    }
    
    @Published var showWelcome = true
    
//    @Published var isPresentedLanding = false
    @Published var isPresentedSelectLogin = false
    @Published var isPresentedPhoneNumber = false
    @Published var isPresentedNumberOTP = false
    @Published var isPresentedEmailOTP = false
    @Published var isPresentedForgotPassword = false
    @Published var isPresentedEmail = false
    @Published var isPresentedLogin = false
    @Published var isShowLoginOption = true
    @Published var isVerified = false
    @Published var verificationsheet = true
    
    
}
