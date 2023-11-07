//
//  ChatOptionsView.swift
//  junxApp
//
//  Created by Hamza Hashmi on 07/11/2023.
//

import SwiftUI

struct ChatOptionsView: View {
    
    private var width = UIScreen.main.bounds.width - 60
    
    var body: some View {
        
        ZStack {
            
            Color.black.opacity(0.6).ignoresSafeArea()
            
            HStack {
                
                Spacer()
                
                VStack {
                    ZStack {
                        Image(.chatPolygon)
                        
                        VStack {
                            OptionView(text: "Call", image: .call)
                            OptionView(text: "Delete Chat", image: .deleteChat)
                            OptionView(text: "Pin Chat", image: .pinChat)
                            OptionView(text: "Mute Notifications", image: .muteNotifications)
                            OptionView(text: "Arrange meetup", image: .meetup)
                            OptionView(text: "Quizes", image: .quiz, showBackground: true)
                        }
                    }
                    .frame(width: 336, height: 468)
                    
                    Spacer()
                }
            }
            .padding(.trailing, 10)
        }
    }
    
    func OptionView(text: String, image: ImageResource, showBackground: Bool = false) -> some View {
        ZStack {
            HStack {
                Text(text)
                    .font(.customFont(name: .inter, type: .regular, size: 16))
            }
            
            HStack {
                
                Image(image)
                    .padding(.leading, 22)
                
                Spacer()
            }
        }
        .frame(height: 54)
        .background {
            
            if showBackground {
                RoundedRectangle(cornerRadius: 16)
                    .foregroundStyle(.greenTheme)
            }
            
            RoundedRectangle(cornerRadius: 16)
                .stroke(lineWidth: 2)
        }
        .padding(.horizontal, 30)
    }
}

#Preview {
    NavigationView {
        ChatOptionsView()
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing) {
                    Image(systemName: "line.3.horizontal")
                }
            })
    }
}
