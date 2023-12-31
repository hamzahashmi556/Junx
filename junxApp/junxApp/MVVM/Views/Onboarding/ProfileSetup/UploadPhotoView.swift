//
//  UploadPhotoView.swift
//  junxApp
//
//  Created by apple on 16/11/2023.
//

import SwiftUI

struct UploadPhotoView: View {
    @ObservedObject var onboardingVM: OnboardingViewModel
    @State var geometry: GeometryProxy
    @State var toolbarVisibility: Visibility
    @State var email = ""
    @State var imageName : [String] = ["profilephot","profilephotoplaceholder","profilephotoplaceholder","profilephotoplaceholder"]
    @State var wrongUser: Bool = true
    @State private var coloumns = [GridItem(), GridItem()]
    var body: some View {
        
        
        
        ZStack {
            
            WhiteBackground()
            
            VStack {
                
                VStack(spacing: 18, content: {
                    
                    Text("Add your Photos")
                        .padding(.top, 35)
                        .font(.customFont(name: .manuale, type: .semiBold, size: 24))
                        .foregroundStyle(.textMain)
                    
                    
                    
                })
                .padding(.horizontal, 25)
                
                
                
                VStack(spacing: 15) {
                    
                    LazyVGrid(columns: coloumns, spacing: 10) {
                        ForEach(0 ..< imageName.count, id: \.self) { index in
                           Image(imageName[index])
                        }
                    }
                    .padding(.horizontal, 45)
                    

                }
                .padding(.top, 35)
                
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
                Text("Profile Set Up")
                    .font(.customFont(name: .SFPRO, type: .regular, size: 16))
                
            }
            
            
            
        })
        
    }
}

#Preview {
    NavigationView {
        GeometryReader { geo in
            UploadPhotoView(onboardingVM: OnboardingViewModel(), geometry: geo, toolbarVisibility: .visible)
        }
    }
   
}
