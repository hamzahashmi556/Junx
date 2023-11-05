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
                    .frame(width: geometry.size.width - 60,height: geometry.size.height * 0.6)
                    
                    .overlay(
                        VStack{
                            
                            Image("image logo")
                                .resizable()
                                .frame(width: 100,height: 60)
                            
                            HStack {
                                Text("Confirm Safety")
                                    .font(.customFont(name: .manuale, type: .semiBold, size: 24))
                                    .foregroundStyle(Color("text-main-2"))
                                
                                //                        Spacer()
                            }
                            HStack{
                                Text("Confirm your Safety or Request Help if needed.")
                                    .font(.customFont(name: .inter, type: .light, size: 14))
                                    .foregroundStyle(Color("70-black"))
                                    .multilineTextAlignment(.center)
                            }.padding(.horizontal,30)
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
