//
//  SelectionCard.swift
//  junxApp
//
//  Created by apple on 16/11/2023.
//

import SwiftUI

struct SelectionCard: View {
    @State var title: String
    @Binding var selected: Bool
    var body: some View {
        ZStack{
            if selected {
                RoundedRectangle(cornerRadius: 15)
                    .foregroundStyle(Color("greenTheme"))
                    .shadow(color:.onlyblack.opacity(0.25),radius: 1,x:0,y:4)
                    .overlay(
                        HStack{
                            Text(title)
                                .font(.customFont(name: .inter, type: .regular, size: 16))
                                .foregroundStyle(.whiteonly)
                            
                            Spacer()
                            
                            Image("Vector-tick")
//                                .resizable()
//                                .frame(width: 16,height: 16)
                          

                        }.padding(.horizontal,20)
                           
                    )
            }  else {
                RoundedRectangle(cornerRadius: 15)
                    .foregroundStyle(.clear)
                
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color("text-border"),lineWidth: 1)
                    .overlay(
                        HStack{
                            Text(title)
                                .font(.customFont(name: .inter, type: .regular, size: 16))
                                .foregroundStyle(Color("textsecondary-5"))
                            
                            Spacer()
                            
                            Image("ticknormal")

                        }.padding(.horizontal,20)
                    )
            }
           
                
        }.frame(width: 310,height: 61)
    }
}

#Preview {
    SelectionCard(title: "Woman", selected: .constant(true))
}
