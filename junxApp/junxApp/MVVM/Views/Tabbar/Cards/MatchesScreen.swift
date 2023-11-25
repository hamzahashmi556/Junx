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
                    HStack{
                        
                        Image("Back")
                            .padding(.leading,30)
                        Spacer()
                        Image("text+image logo")
                            .padding(.trailing,50)
                        Spacer()
                    }
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
                                .offset(y:30)
                            Image("icon p")
                                .offset(x:-15,y:-10)
                        }
                    }
                    
                    Text("It’s a match!")
                        .font(.customFont(name: .manuale, type: .semiBold, size: 24))
                        .foregroundStyle(.textMain)
                    
                    HStack {
                        Spacer()
                        Text("Don’t waste more time! Just start a conversation with each other....")
                            .font(.customFont(name: .inter, type: .regular, size: 14))
                            .multilineTextAlignment(.center)
                            .foregroundStyle(Color("70-black"))
                            .padding(.top,5)
                        Spacer()
                    }.padding(.horizontal,25)
                    
                    
                    Spacer()
                
                    CustomButton(title: "Say Hello", width: 295, action: {
                        
                    })
                    
                    CustomButtonLightGreen(title: "Keep Swiping", width: 295, fontType: .bold, size: 16, action: {
                        
                    }).padding(.top,5)
                        .padding(.bottom,10)
                    
                    
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
