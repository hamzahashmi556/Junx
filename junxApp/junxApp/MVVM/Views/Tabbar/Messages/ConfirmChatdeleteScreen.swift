//
//  ConfirmDeleteScreen.swift
//  junxApp
//
//  Created by apple on 07/11/2023.
//

import SwiftUI

struct ConfirmDeleteChatScreen: View {
    @State var geometry: GeometryProxy
    var body: some View {
        ZStack{
            WhiteBackground()
            VStack{
               
                Spacer()
                Image("JunX text")
                    .resizable()
                    .frame(width: 130,height: 58)
                    .padding(.vertical,60)
                
                Text("Delete Chat!")
                    .font(.customFont(name: .inter, type: .semiBold, size: 14))
                    .foregroundStyle(Color("424753"))
                
                
                Text("Are you sure you want to delete this chat?")
                    .font(.customFont(name: .inter, type: .regular, size: 14))
                    .foregroundStyle(Color("70-black"))
                    .padding(.vertical,5)
                Spacer()
                CustomButton(title: "Continue", width: geometry.size.width - 60, action: {
                    
                })
                .padding(.bottom)
               
                CustomButtonLightGreenBold(title: "Cancel", width: geometry.size.width - 60, action: {
                    
                })
               
            }
            
        }
    }
}

#Preview {
    GeometryReader { gr in
        ConfirmDeleteChatScreen(geometry: gr)
    }
   
}
