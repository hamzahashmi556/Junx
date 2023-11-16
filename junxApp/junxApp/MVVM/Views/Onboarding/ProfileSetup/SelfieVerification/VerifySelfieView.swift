//
//  VerifySelfieView.swift
//  junxApp
//
//  Created by apple on 16/11/2023.
//

import SwiftUI

struct VerifySelfieView: View {
    @State var geometry: GeometryProxy
    var body: some View {
        ZStack{
            WhiteBackground()
            VStack{
                Spacer()
                Image("JunX text")
                    .padding(.bottom,30)
               
                HStack {
                    
                    Text("Please Wait, We're Verifying Your Identity.\n This May Take a Moment")
                        .font(.customFont(name: .inter, type: .regular, size: 14))
                    .foregroundStyle(Color("text-secondary-4"))
                    .multilineTextAlignment(.center)
               
                }.padding(.horizontal,30)
                    .padding(.vertical,30)
                Spacer()
                
                Image("Group 8757")
                    .resizable()
                    .frame(width: 51,height: 12)
                    .padding(.bottom,40)
               
            }
        }
    }
}

#Preview {
    GeometryReader { gr in
        VerifySelfieView(geometry: gr)
    }
   
}
