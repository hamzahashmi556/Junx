//
//  HobbiesView.swift
//  junxApp
//
//  Created by Hamza Hashmi on 18/11/2023.
//

import SwiftUI

let width = UIScreen.main.bounds.width

struct HobbiesView: View {
    
    
    var body: some View {
        ZStack {
            
            WhiteBackground()
            
            VStack {
                Text("What Are Your Interest?")
                    .font(.customFont(name: .manuale, type: .semiBold, size: 24))
                    .foregroundStyle(.textMain)
                    .padding(.top, 28)
                
                LazyVGrid(columns: [.init(), .init()], spacing: 15, content: {
                    HobbyView(image: .photography, text: "Photography", isSelected: false)
                    HobbyView(image: .shoppingWhite, text: "Shopping", isSelected: true)
                    HobbyView(image: .karaoke, text: "Karaoke", isSelected: false)
                    HobbyView(image: .yoga, text: "Yoga", isSelected: false)
                    HobbyView(image: .cooking, text: "Cooking", isSelected: false)
                    HobbyView(image: .tennis, text: "Tennis", isSelected: false)
                    HobbyView(image: .runWhite, text: "Run", isSelected: true)
                    HobbyView(image: .swimming, text: "Swimming", isSelected: false)
                    HobbyView(image: .art, text: "Art", isSelected: false)
                    HobbyView(image: .travelingWhite, text: "Traveling", isSelected: true)
                    HobbyView(image: .extreme, text: "Extreme", isSelected: false)
                    HobbyView(image: .music, text: "Music", isSelected: false)
                    HobbyView(image: .drink, text: "Drink", isSelected: false)
                    HobbyView(image: .videoGames, text: "Video games", isSelected: false)
                })
                .padding(.top, 43)
                .padding(.horizontal, UIScreen.main.bounds.width * 0.05)
                
                Spacer()
                
                CustomButton(title: "Continue", width: width * 0.757) {
                    
                }
            }
        }
        .toolbarTitleDisplayMode(.inline)
        .toolbar(content: {
            ToolbarItem(placement: .topBarLeading) {
                Image("Back")
            }
            ToolbarItem(placement: .principal) {
                Text("Profile Setup")
                    .font(.customFont(name: .SFPRO, type: .medium, size: 16))
            }
        })

    }
    
    func HobbyView(image: ImageResource, text: String, isSelected: Bool) -> some View {
        HStack {
            
            Image(image)
                .padding(.leading, 15)
            
            Text(text)
                .font(.customFont(name: .inter, type: .regular, size: 14))
                .foregroundStyle(isSelected ? .white : .textMain)
            
        }
        .frame(minWidth: 146, maxWidth: UIScreen.main.bounds.width * 0.4, minHeight: 47, alignment: .leading)
        .background {
            if isSelected {
                RoundedRectangle(cornerRadius: 15)
                    .foregroundStyle(.greenTheme)
            }
            else {
                RoundedRectangle(cornerRadius: 15)
                    .stroke()
                    .foregroundStyle(.tfBorder)
            }
        }
    }
}

#Preview {
    NavigationView {
        HobbiesView()
    }
}
