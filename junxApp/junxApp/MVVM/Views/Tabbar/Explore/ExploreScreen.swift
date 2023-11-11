//
//  ExploreScreen.swift
//  junxApp
//
//  Created by apple on 09/11/2023.
//

import SwiftUI

struct ExploreScreen: View {
    var body: some View {
     
            GeometryReader { reader in
                ZStack{
                    WhiteBackground()
                    VStack {
//                        HStack{
//                           
//                            Image("Back")
//                                .padding(.leading,20)
//                            Spacer()
//                            Image("text+image logo")
//                                .padding(.trailing,50)
//                            Spacer()
//                        }
                        Spacer()
                        HStack{
                            Spacer()
                            Text("Let’s Explore Our Community!")
                                .font(.customFont(name: .manuale, type: .semiBold, size: 24))
                            .foregroundStyle(.textMain)
                            
                            Spacer()
                        }.padding(.bottom,20)
                       
                        ZStack{
                            Image("Group 1171276009")
                                
                            
                        }.padding(.bottom,40)
                        HStack {
                            Spacer()
                            
                            Text("We are finding people to discover. Wait a while!")
                                .font(.customFont(name: .inter, type: .regular, size: 14))
                                .multilineTextAlignment(.center)
                                .foregroundStyle(.textSecondary)
                            .padding(.horizontal,35)
                            
                            Spacer()
                        }
                        
                           
                                
                            
                            Text("Loading...")
                                .font(.customFont(name: .inter, type: .bold, size: 14))
                                .multilineTextAlignment(.center)
                                .foregroundStyle(.textSecondary)
                            .padding(.horizontal,35)
                            .padding(.top)
                        
                        Spacer()
                        
                        
                        
                        
                       
                    }
                }
                    
                
            }.toolbar {
                ToolbarItem(placement: .principal) {
                    Image("text+image logo")
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    Image("Back")
                }
            }
        
    }
}

#Preview {
    TabbarView(homeVM: HomeViewModel(), index: 3)
}
