//
//  ProfileCompleteView.swift
//  junxApp
//
//  Created by apple on 16/11/2023.
//

import SwiftUI

struct ProfileCompleteView: View {
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
                    .frame(width: 338,height: 388)
                
                    .overlay(
                        VStack{
                            
                            Spacer()
                            
                            HStack {
                                Text("Profile Completed")
                                    .font(.customFont(name: .manuale, type: .semiBold, size: 24))
                                    .foregroundStyle(Color("text-main-2"))
                                
                                //                        Spacer()
                            }
                            
                            Image("image logo")
                                .resizable()
                                .frame(width: 100,height: 60)
                                .padding(.vertical,40)
                           
                           
                            HStack{
                                Text("Your profile is completed, Start Exploring Matches")
                                    .font(.customFont(name: .inter, type: .regular, size: 14))
                                    .foregroundStyle(Color("70-black"))
                                    .multilineTextAlignment(.center)
                           
                            }.padding(.horizontal,70)
                            
                            
                            
                            Spacer()
                        }
                    )
            }
        }
    }
}

#Preview {
    GeometryReader { gr in
        ProfileCompleteView(geometry: gr)
    }
  
}
