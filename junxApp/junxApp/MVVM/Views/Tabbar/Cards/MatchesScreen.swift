//
//  MatchesScreen.swift
//  junxApp
//
//  Created by apple on 08/11/2023.
//

import SwiftUI

struct MatchesScreen: View {
    @State var geometry: GeometryProxy
    var body: some View {
        
        GeometryReader { gr in 
            ZStack{
                WhiteBackground()
                VStack{
                    Spacer()
                    VStack{
                        ZStack{
                            
                            HStack {
                                
                                Image("9dc682f3-5627-4e85-ac5f-affb20035d3a 4")
                                    .resizable()
                                    .frame(width: 164,height: 198)
                                    .offset(x:4,y:-60)
                                Image("f6d15cc0389b8b6bd4162f85e01eed44 3")
                                    .resizable()
                                    .frame(width: 164,height: 198)
                                    .offset(x:-4,y:60)
                            }
                            Image("Group 1171275857")
                                .offset(y:20)
                            Image("icon p")
                        }
                    }
                    Spacer()
                    Text("It’s a match!")
                        .font(.customFont(name: .manuale, type: .semiBold, size: 24))
                        .foregroundStyle(.textMain)
                    
                    Text("Don’t waste more time! Just start a conversation with each other....")
                        .font(.customFont(name: .inter, type: .regular, size: 14))
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.textSecondary)
                        .padding(.top,5)
                    Spacer()
                    CustomButton(title: "Say Hello", width: geometry.size.width - 60, action: {
                        
                    })
                    
                    CustomButtonLightGreenBold(title: "Keep Swiping", width: geometry.size.width - 60, action: {
                        
                    }).padding(.top,5)
                    
                   
                }
            }
           
        }
        .toolbar {
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
    GeometryReader {
        gr in
        MatchesScreen(geometry: gr)
    }
   
}
