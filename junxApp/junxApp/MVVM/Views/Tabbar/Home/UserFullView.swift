//
//  FollowerScreen.swift
//  junxApp
//
//  Created by apple on 08/11/2023.
//

import SwiftUI

struct UserFullView: View {
    @State var geometry: GeometryProxy
    var body: some View {
        ZStack{
            Image("dd7cf50c-d236-4b5d-8151-baa9ff91e4b5 2")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            VStack{
                Spacer()
                RoundedRectangle(cornerRadius: 0)
                    .frame(width: geometry.size.width,height: geometry.size.height * 0.40)
                    .foregroundStyle(Color("#1A1B1E").opacity(0.6))
                    .ignoresSafeArea()
                    .overlay(
                        VStack{
                            VStack{
                                Text("Jane Doe")
                                    .font(.customFont(name: .manuale, type: .semiBold, size: 24))
                                    .foregroundStyle(.whiteonly)
                                Text("Bikini Model")
                                    .font(.customFont(name: .inter, type: .light, size: 14))
                                    .foregroundStyle(.whiteonly.opacity(0.52))
                            }.padding(.top,20)

                            Spacer()
                            HStack{
                                VStack{
                                    
                                    Image("users-wm")
                                    Text("Female")
                                        .font(.customFont(name: .inter, type: .light, size: 12))
                                        .foregroundStyle(.whiteonly)
                                }.frame(width: geometry.size.width * 0.3)
                                Spacer()
                                VStack{
                                    Image("fav-remove")
                                    
                                    Text("2 Relationship")
                                        .font(.customFont(name: .inter, type: .light, size: 12))
                                        .foregroundStyle(.whiteonly)
                                }.frame(width: geometry.size.width * 0.3)
                                Spacer()
                                VStack{
                                    
                                    Image("pin-3")
                                    Text("Berlin, Germany")
                                        .font(.customFont(name: .inter, type: .light, size: 12))
                                        .foregroundStyle(.whiteonly)
                                }.frame(width: geometry.size.width * 0.3)
                            }.padding(.horizontal,30)
                                .padding(.vertical,30)
                            Spacer()
                            
                            CustomButton(title: "Follow", width: geometry.size.width - 60, action: {
                                
                            }).padding(.bottom,30)
                        }
                    )
                    

            }
        }
    }
}

#Preview {
    GeometryReader{ gr in
        UserFullView(geometry: gr)
    }
    
}
