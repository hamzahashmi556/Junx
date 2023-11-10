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
                
                HStack {
                    
                    Text("Add Filters For Better Experience")
                        .font(.customFont(name: .manuale, type: .regular, size: 20))
                    
                    Spacer()
                }
                .padding(.horizontal, 25)
                
                Image(.hey)
                    .padding(.top, 11)
                    .padding(.bottom, 7)
                
                Text("Enhance your Dating experience with our advanced filters! Find your perfect match by customizing your search criteria for age, location, and interests.\nFiltered explorations ")
                    .font(.customFont(name: .inter, type: .regular, size: 14))
                    .foregroundStyle(.textSecondary)
                    .padding(.horizontal, 25)
                    .padding(.bottom, 20)
                
                VStack(spacing: 16) {
                    
                    CustomButton(title: "Apply filter", width: Constants.size.width - 100, action: {
                        
                    })
                    
                    CustomButton(title: "Cancel", width: Constants.size.width - 100, action: {
                        
                    })

                }
            }
            
        }
        .presentationDragIndicator(.visible)
        .presentationCornerRadius(24)
        .presentationDetents([.medium])
        .presentationBackground(.cardBg2)
    }
}

#Preview {
    MembersList(viewModel: HomeViewModel(), title: "New Memberrs")
}
