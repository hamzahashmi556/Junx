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
                        HStack{
                           
                            Image("Back")
                                .padding(.leading,20)
                            Spacer()
                            Image("text+image logo")
                                .padding(.trailing,50)
                            Spacer()
                        }
                        Spacer()
                        HStack{
                            Spacer()
                            Text("Let’s Explore Our Community!")
                                .font(.customFont(name: .manuale, type: .semiBold, size: 24))
                            .foregroundStyle(.textMain)
                            
                            Spacer()
                        }
                        Spacer()
                        ZStack{
                            Image("Group 1171276009")
                            
                        }
                        Spacer()
                        VStack{
                            HStack {
                                Spacer()
                                
                                Text("We are finding people to discover. Wait a while!")
                                    .font(.customFont(name: .inter, type: .regular, size: 14))
                                    .multilineTextAlignment(.center)
                                    .foregroundStyle(.textSecondary)
                                .padding(.horizontal,35)
                                
                                Spacer()
                            }.padding(.vertical,10)
                            
                            Text("Loading...")
                                .font(.customFont(name: .inter, type: .bold, size: 14))
                                .multilineTextAlignment(.center)
                                .foregroundStyle(.textSecondary)
                            .padding(.horizontal,35)
                        }
                       
                    }
                }
                    
                
            }.toolbar {
                ToolbarItem(placement: .principal) {
                    Image("text+image logo")
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Image("header")
                }
            }
        
    }
}

#Preview {
    ExploreScreen()
}
