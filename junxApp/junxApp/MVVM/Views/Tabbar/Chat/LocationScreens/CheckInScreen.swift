//
//  CheckInScreen.swift
//  junxApp
//
//  Created by apple on 07/11/2023.
//

import SwiftUI

struct CheckInScreen: View {
    @State var geometry: GeometryProxy
    var body: some View {
        ZStack{
            LinearGradient(colors: [.mainBackgroundLinear1, .mainBackgroundLinear2],
                           startPoint: .top,
                           endPoint: .bottom)
            .ignoresSafeArea()
            
            VStack(spacing:0) {
                RoundedRectangle(cornerRadius: 30)
                    .foregroundStyle(.cardBg)
                    .frame(width: geometry.size.width - 60,height: geometry.size.height * 0.52)
                
                    .overlay(
                        VStack{
                            Spacer()
                            Image("Circlesuccess")
                                .resizable()
                                .frame(width: 140,height: 140)
                            
                            Spacer()
                            
                            
                            HStack {
                                Text("Check-In Successful ")
                                    .font(.customFont(name: .manuale, type: .semiBold, size: 24))
                                    .foregroundStyle(Color("text-main-2"))
                                
                                //                        Spacer()
                            }
                            HStack{
                                Text("Check-In Successful! Enjoy your Date With Peace of Mind")
                                    .font(.customFont(name: .inter, type: .regular, size: 14))
                                    .foregroundStyle(Color("text secondary-2"))
                                    .multilineTextAlignment(.center)
                            }.padding(.horizontal,30)
                            
                            
                            
                            
                            
                            Spacer()
                            
                            CustomButton(title: "Continue", width: geometry.size.width - 130, action: {
                                
                            })
                            
                            Spacer()
                        }
                    )
            }
        }
    }
}

#Preview {
    GeometryReader { gr in
        CheckInScreen(geometry: gr)
    }
    
}
