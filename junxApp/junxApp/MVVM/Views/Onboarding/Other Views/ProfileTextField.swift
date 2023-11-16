//
//  ProfileTextField.swift
//  junxApp
//
//  Created by apple on 16/11/2023.
//

import SwiftUI

struct ProfileTextField: View {
    @Binding var title: String
    @State var placeHolder: String
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 16)
                .stroke(.profileborder,lineWidth: 3)
                .overlay(
                    
                    HStack {
                        Spacer()
                        TextField(placeHolder, text: $title)
                            .multilineTextAlignment(.center)
                                                        .frame(minWidth: 0, maxWidth: .infinity) //
                                                        .padding(.leading, 8)
                           
                        Spacer()
                    }
                )
        }.frame(width: 275,height: 54)
    }
}

#Preview {
    ProfileTextField(title: .constant(""), placeHolder: "First Name")
}
