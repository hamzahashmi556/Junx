//
//  RemindersView.swift
//  junxApp
//
//  Created by Hamza Hashmi on 18/11/2023.
//

import SwiftUI

struct RemindersView: View {
    var body: some View {
        ZStack {
            
            WhiteBackground()
            
            VStack(spacing: 0) {
                
                Text("Reminders")
                    .padding(.top, 28)
                    .font(.customFont(name: .manuale, type: .semiBold, size: 24))
                
                Text("Users with notifications enabled are over 2x more likely to stick to their investments")
                    .padding(.horizontal, 25)
                    .padding(.top, 18)
                    .font(.customFont(name: .inter, type: .regular, size: 14))
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.textSecondary4)
                
                VStack(spacing: 12) {
                    
                    SettingView(text: "Price alerts", description: "Get a reminder about price changes", isOn: true)
                    
                    SettingView(text: "News", description: "Stay updated", isOn: false)
                    
                    SettingView(text: "Announcements", description: "Get a reminder about changes", isOn: true)
                }
                .padding(.top, 82)
                
                Spacer()
                
                CustomButton(title: "Continue", action: {
                    
                })
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
    
    func SettingView(text: String, description: String, isOn: Bool) -> some View {
        ZStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(text)
                        .font(.customFont(name: .inter, type: .medium, size: 16))
                        .foregroundStyle(.textMain)
                    
                    Text(description)
                        .font(.customFont(name: .inter, type: .regular, size: 14))
                        .foregroundStyle(.textSecondary4)
                }
                .padding(.leading, 16)
                
                Spacer()
                
                ZStack {
                    RoundedRectangle(cornerRadius: 50)
                        .foregroundStyle(Color(hexString: "FfFfFf"))
                    
                    HStack {
                        if isOn {
                            Spacer()
                        }
                        
                        Circle()
                            .frame(width: 18, height: 18)
                            .foregroundStyle(isOn ? .greenTheme : .black.opacity(0.1))
                            .padding(.horizontal, 6)
                        
                        if !isOn {
                            Spacer()
                        }
                    }
                }
                .frame(width: 63, height: 30)
                .padding(.trailing, 16)
            }
        }
        .frame(width: Constants.width - 32, height: 82, alignment: .leading)
        .background {
            RoundedRectangle(cornerRadius: 16)
                .foregroundStyle(.lightgrayGreen)
        }
    }
}

#Preview {
    NavigationView(content: {
        RemindersView()
    })
}
