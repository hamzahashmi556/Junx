//
//  WhiteBackground.swift
//  junxApp
//
//  Created by Hamza Hashmi on 22/10/2023.
//

import SwiftUI

struct WhiteBackground: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        if colorScheme == .light {
            Color.white.ignoresSafeArea()
        }
        else {
            LinearGradient(colors: [.mainBackgroundLinear1, .mainBackgroundLinear2],
                           startPoint: .top,
                           endPoint: .bottom)
            .ignoresSafeArea()
        }
    }
}

struct splashBackground: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        if colorScheme == .light {
            Color.greenTheme
        }
        else {
            LinearGradient(colors: [.mainBackgroundLinear1, .mainBackgroundLinear2],
                           startPoint: .top,
                           endPoint: .bottom)
            .ignoresSafeArea()
        }
    }
}

struct tintBackground: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        if colorScheme == .light {
            Color.black.opacity(0.7)
                       .edgesIgnoringSafeArea(.all)
        }
        else {
            Color.black.opacity(0.8)
                       .edgesIgnoringSafeArea(.all)
            .ignoresSafeArea()
        }
    }
}

#Preview {
    WhiteBackground()
}
