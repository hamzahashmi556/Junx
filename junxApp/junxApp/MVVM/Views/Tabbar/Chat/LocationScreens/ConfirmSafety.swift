//
//  ConfirmSafety.swift
//  junxApp
//
//  Created by apple on 06/11/2023.
//

import SwiftUI

struct ConfirmSafety: View {
    @State var geometry: GeometryProxy
    var body: some View {
        ZStack{
            WhiteBackground()
            tintBackground()
            VStack(spacing:0) {
                RoundedRectangle(cornerRadius: 30)
                    .foregroundStyle(.cardBg)
                    .frame(width: geometry.size.width - 60,height: geometry.size.height * 0.52)
                    
                    .overlay(
                        VStack{
                            Spacer()
                            Image("image logo")
                                .resizable()
                                .frame(width: 100,height: 60)
                            Spacer()
                            VStack{
                                
                                HStack {
                                    Text("Confirm Safety")
                                        .font(.customFont(name: .manuale, type: .semiBold, size: 24))
                                        .foregroundStyle(Color("text-main-2"))
                                    
                                    //                        Spacer()
                                }
                                HStack{
                                    Text("Confirm your Safety or Request Help if needed.")
                                        .font(.customFont(name: .inter, type: .regular, size: 14))
                                        .foregroundStyle(Color("text secondary-2"))
                                        .multilineTextAlignment(.center)
                                }.padding(.horizontal,30)
                                    
                                  
                            }
                           
                            Spacer()
                           
                            HStack(spacing:35){
                                CircleButton(title: "", width: 86, height: 86, action: {
                                    
                                })
                                
                                Circle()
                                    .frame(width: 86,height: 86)
                                    .foregroundStyle(Color("979797"))
                                    .overlay(
                                        Image("1171275936")
                                            .resizable()
                                            .frame(width: 40,height: 40)
                                    )
                            }
                                
                            Spacer()
                        }
                    )
            }
            
          
        }
    }
}

#Preview {
    GeometryReader { gr in
        ConfirmSafety(geometry: gr)
    }
    
}
