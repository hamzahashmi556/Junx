//
//  DecidePlaceScreen.swift
//  junxApp
//
//  Created by apple on 08/11/2023.
//

import SwiftUI

struct DecidePlaceScreen: View {
    @State var geometry: GeometryProxy
    var body: some View {
        ZStack{
            WhiteBackground()
            VStack{
                Image("text+image logo")
                    .padding(.vertical,20)
                HStack {
                    Text("Need A Place To Hangout?")
                        .font(.customFont(name: .manuale, type: .semiBold, size: 24))
                        .foregroundStyle(Color("text-main-2"))
                    
                    Spacer()
                }.padding(.leading,20)
                HStack {
                    Text("Select Activity")
                        .font(.customFont(name: .manuale, type: .regular, size: 24))
                        .foregroundStyle(Color("text-main-2"))
                    
                    Spacer()
                }.padding(.leading,20)
                
                
                HStack {
                    Image("Power Icon")
                    VStack{
                        HStack {
                            Text("37.5")
                                .font(.customFont(name: .inter, type: .regular, size: 24))
                                .foregroundStyle(Color("simpleblack"))
                                 + Text(" km away")
                                .font(.customFont(name: .inter, type: .regular, size: 14))
                            .foregroundStyle(Color("simpleblack"))
                            
                            Spacer()
                        }
                        
                        HStack {
                            Text("2 hours drive")
                                .font(.customFont(name: .inter, type: .regular, size: 12))
                            .foregroundStyle(Color("textcolor-3"))
                            Spacer()
                        }
                         
                    }
                    Spacer()
                }.padding(.leading,20)
                    .padding(.vertical,10)
                
                ScrollView(.horizontal){
                    HStack{
                        Image("Living Room")
                        Image("Bathroom")
                    }
                    
                }.padding(.leading,20)
                    .padding(.top,35)
                
                
               
                Spacer()
               
                
                
                RoundedRectangle(cornerRadius: 50)
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.18, alignment: .center)
                    .foregroundStyle(.fiftyblack)
                    .overlay(
                        HStack{
                            
                            Image("Combined Shape")
                                .padding(.horizontal,20)
                            
                            VStack{
                                HStack {
                                    Text("Allow GPS")
                                        .font(.customFont(name: .inter, type: .semiBold, size: 16))
                                    .foregroundStyle(Color("whiteonly"))
                                    
                                   Spacer()
                                }
                                HStack {
                                    Text("Allow GPS to find activity near you")
                                        .font(.customFont(name: .inter, type: .semiBold, size: 12))
                                    .foregroundStyle(Color("whiteonly"))
                                    
                                    Spacer()
                                }
                            }.frame(width: 240)
                            
                           Spacer()
                        }.padding(.leading,20)
                    ).offset(y:40)
                
                
            }
            
            
        }.frame(width: geometry.size.width)
    }
}

#Preview {
    GeometryReader { gr in
        DecidePlaceScreen(geometry: gr)
    }
    
}
