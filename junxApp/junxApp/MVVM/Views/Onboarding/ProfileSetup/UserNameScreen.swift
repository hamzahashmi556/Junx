//
//  UserNameScreen.swift
//  junxApp
//
//  Created by apple on 16/11/2023.
//

import SwiftUI

struct UserNameScreen: View {
    @ObservedObject var onboardingVM: OnboardingViewModel
    @State var geometry: GeometryProxy
    @State var toolbarVisibility: Visibility
    @State var email = ""
    @State var wrongUser: Bool = true
    var body: some View {
        
        
        
        ZStack {
            
            WhiteBackground()
            
            VStack {
                
                VStack(spacing: 18, content: {
                    
                    Text("Create Username!")
                        .padding(.top, 35)
                        .font(.customFont(name: .manuale, type: .semiBold, size: 24))
                        .foregroundStyle(.textMain)
                    
                  
                       
                    
                })
                .padding(.horizontal, 25)
                
               
                
                VStack(spacing: 15) {
                    
                   
                    

                    ZStack{
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(  Color("979797"),lineWidth: 1)
                            .overlay(
                              

                                HStack {
                                    Image("Union")
                                        .resizable()
                                        .frame(width: 24,height: 24)
                                   
                                    TextField("Darshan Raval", text: .constant(""))
                                        //.font(.customFont(name: .SFPRO, type: .semiBold, size: 14))
                                        .foregroundStyle(Color("placeholderColor"))
                                       
                                    Spacer()
                                }.padding(.leading)
                            )
                    }.frame(width: 310,height: 60)
                    
                    HStack {
                        if !wrongUser {
                            Image("Group 1171275983")
                            Text("Username available")
                                .font(.customFont(name: .inter, type: .regular, size: 14))
                                .multilineTextAlignment(.center)
                                .foregroundStyle(Color("#1F8435"))
                        } else {
                            Image("wronguser")
                            Text("Username available")
                                .font(.customFont(name: .inter, type: .regular, size: 14))
                                .multilineTextAlignment(.center)
                                .foregroundStyle(Color("EC000A"))
                        }
                       
                        
                        Spacer()
                    }.frame(width: 300)
                    
                    HStack {
                        Text("*NOTE: At least 8 characters, containing a letter and a number")
                            .font(.customFont(name: .inter, type: .regular, size: 13))
                            .foregroundStyle(.EDEDED)
                        
                        
                        
                    }.frame(width: 300)
                        .padding(.top,2)
                    
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
                Text("Profile Settings")
                    .font(.customFont(name: .SFPRO, type: .medium, size: 16))
                    //.foregroundStyle(.onlyblack)
                
            }
            
            
            
        })
        
    }
}

#Preview {
    
    
    NavigationView {
        GeometryReader { geo in
            UserNameScreen(onboardingVM: OnboardingViewModel(), geometry: geo, toolbarVisibility: .visible)
        }
    }
}
