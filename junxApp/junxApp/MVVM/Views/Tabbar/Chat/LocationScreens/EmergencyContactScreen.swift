//
//  EmergencyContactScreen.swift
//  junxApp
//
//  Created by apple on 05/11/2023.
//

import SwiftUI

struct EmergencyContactScreen: View {
    @State var geometry: GeometryProxy
    var body: some View {
        ZStack{
            WhiteBackground()
            VStack(spacing:10){
                HStack {
                    Text("Add Emergency Contacts")
                        .font(.customFont(name: .manuale, type: .semiBold, size: 24))
                        .foregroundStyle(Color("text-main-2"))
                    
                  
                    //                        Spacer()
                }.padding(.vertical,30)
                VStack{
                    TextFieldBordered(text: .constant("Name"), title: "Name", color: .tfBorder3, isSecureField: false, width: geometry.size.width - 60)
                    
                    TextFieldBordered(text: .constant("Name"), title: "Contact", color: .tfBorder3, isSecureField: false, width: geometry.size.width - 60)
                }.padding(.top,30)
                
                HStack {
                    Text("Optional")
                        .font(.customFont(name: .inter, type: .semiBold, size: 16))
                        .foregroundStyle(Color("text-main-2"))
                    
                    Spacer()
                }.padding(.leading,30)
                
                VStack{
                    TextFieldBordered(text: .constant("Name"), title: "Name", color: .tfBorder3, isSecureField: false, width: geometry.size.width - 60)
                    
                    TextFieldBordered(text: .constant("Name"), title: "Contact", color: .tfBorder3, isSecureField: false, width: geometry.size.width - 60)
                }.padding(.top,30)
               
                
                Spacer()
                
                CustomButton(title: "Continue", width: Constants.size.width - 100, action: {
                    
                }).padding(.bottom,20)
            }
        }
    }
}

#Preview {
    GeometryReader { geo in 
        EmergencyContactScreen(geometry: geo)
    }
  
}
