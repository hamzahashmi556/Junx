//
//  SelfieFailView.swift
//  junxApp
//
//  Created by apple on 17/11/2023.
//

import SwiftUI

struct SelfieMatchView: View {
    @State var geometry: GeometryProxy
    var body: some View {
        ZStack{
            WhiteBackground()
            VStack{
                Spacer()
                Image("JunX text")
                    .padding(.bottom,50)
               
                HStack {
                    
                    Text("Selfie Matched Succesfully")
                        .font(.customFont(name: .inter, type: .medium, size: 14))
                    .foregroundStyle(Color("424753"))
                    .multilineTextAlignment(.center)
                  
                }.padding(.horizontal,30)
                   
                Spacer()
                
                Spacer()
                
                CustomButton(title: "Continue", width: 295) {
                    
                }.padding(.bottom,20)
               
            }
        }
    }
}


struct SelfieFailView: View {
    @State var geometry: GeometryProxy
    var body: some View {
        ZStack{
            WhiteBackground()
            VStack{
                Spacer()
                Image("JunX text")
                    .padding(.bottom,50)
               
                HStack {
                    
                    Text("Verification ")
                        .font(.customFont(name: .inter, type: .regular, size: 14))
                    .foregroundStyle(Color("424753"))
                    + Text("Failed!")
                        .font(.customFont(name: .inter, type: .bold, size: 14))
                        .foregroundStyle(Color("FF3D00"))

                  
                }.padding(.horizontal,30)
                
                Text("Please retake your selfie in good lighting.")
                    .font(.customFont(name: .inter, type: .regular, size: 14))
                    .foregroundStyle(Color("424753"))
                   
                Spacer()
                
                Spacer()
                
                CustomButton(title: "Retake", width: 295) {
                    
                }.padding(.bottom,20)
               
            }
        }
    }
}

#Preview {
    GeometryReader { gr in
        SelfieMatchView(geometry: gr)
       // SelfieFailView(geometry: gr)
    }
    
}
