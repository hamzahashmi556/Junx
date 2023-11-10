//
//  NewLocationScreen.swift
//  junxApp
//
//  Created by apple on 04/11/2023.
//

import SwiftUI

struct NewLocationScreen: View {
    @State var geometry: GeometryProxy
    var body: some View {
        
        ZStack{
            
           
           WhiteBackground()
            
            VStack{
                OnboardingTopView(title: "Add Location", subTitle: "Add your current location to get matches near you.")
                
                Spacer()
                
                CustomButton(title: "Continue", width: geometry.size.width - 95) {
                    
                }
            }
            
            
            

            tintBackground()
           
            
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(Color("card-bg-2"))
                .frame(width: geometry.size.width - 60,height: geometry.size.height * 0.35)
               
                .overlay(
                    VStack(spacing: 0) {
                        
                      
                        VStack(spacing: 10, content: {
                            
                            Text("New Location")
                                .padding(.top, 35)
                                .font(.customFont(name: .manuale, type: .semiBold, size: 24))
                                .foregroundStyle(.textMain)
                            
                            
                                Text("Do you want to change location? It means having new matches and different people across cities.")
                                    .font(.customFont(name: .inter, type: .regular, size: 14))
                                    .multilineTextAlignment(.leading)
                                    .padding(.top, 18)
                                    .foregroundStyle(.textSecondary)
                            VStack{
                                HStack {
                                    CustomButtonLightGreen(title: "Premium to Change Location", width: 218, fontType: .regular, size: 14, action: {
                                        
                                    })
                                    
                                    Spacer()
                                }
                                VStack{
                                    HStack {
                                        ZStack{
                                            RoundedRectangle(cornerRadius: 92)
                                                .foregroundColor(Color("tfBorder2"))
                                            

                                            
                                            RoundedRectangle(cornerRadius: 92)
                                                .stroke(Color("button-border"),lineWidth: 1)
                                                .overlay(
                                                    Text("Stop")
                                                        .font(.customFont(name: .inter, type: .regular, size: 14))
                                                        .foregroundStyle(.textMain)
                                                        
                                                )
                                            
                                           
                                            
                                            
                                        }.frame(width: 92,height: 39)
                                            
                                        
                                        Spacer()
                                    }
                                }
                              
                                
                            }
                                .padding(.vertical,10)
                           
                            
                        })
                        .padding(.horizontal, 25)
                    }
                )
        }.frame(width: geometry.size.width)
    }
}

#Preview {
    GeometryReader { geometry in
        NewLocationScreen(geometry: geometry)
    }
}
