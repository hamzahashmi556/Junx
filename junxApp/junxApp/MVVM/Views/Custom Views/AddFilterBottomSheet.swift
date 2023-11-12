//
//  AddFilterBottomSheet.swift
//  junxApp
//
//  Created by Hamza Hashmi on 04/11/2023.
//

import SwiftUI

struct AddFilterBottomSheet: View {
    
    @ObservedObject var homeVM: HomeViewModel
    
    var body: some View {
        ZStack{
//            WhiteBackground()
            VStack(spacing: 0) {
                Spacer()
                HStack {
                    Spacer()
                    Text("Add Filters For Better Experience")
                        .font(.customFont(name: .manuale, type: .regular, size: 20))
                    
                    Spacer()
                }
                .padding(.horizontal, 25)
                .padding(.top, 20)
                Spacer()
                Image(.hey)
                   
                    .padding(.bottom, 11)
                
                Text("Enhance your Dating experience with our advanced filters! Find your perfect match by customizing your search criteria for age, location, and interests.\nFiltered explorations ")
                    .font(.customFont(name: .inter, type: .regular, size: 14))
                    .foregroundStyle(Color("text-secondary-4"))
                    .padding(.horizontal, 25)
                    .padding(.bottom, 0)
                    .multilineTextAlignment(.center)
                
                   Spacer()
               
                    CustomButton(title: "Apply filter", width: 295, action: {
                        
                    }).padding(.bottom,10)
                    
                    CustomButtonLightGreen(title: "Cancel", width: 295, fontType: .bold, size: 16) {
                        
                    }
                
                  
               
                    
               
            }
            
        }
        .presentationDragIndicator(.visible)
        .presentationCornerRadius(24)
        .presentationDetents([.height(349)])
        .presentationBackground(.cardBg2)
    }
}

#Preview {
    MembersList(viewModel: HomeViewModel(), title: "New Memberrs")
}
