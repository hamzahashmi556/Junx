//
//  junxAppApp.swift
//  junxApp
//
//  Created by Hamza Hashmi on 21/10/2023.
//

import SwiftUI

@main
struct junxAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear(perform: {
                    printAvailableFonts()
                })
        }
    }
    
    func printAvailableFonts() {
        let fontFamilyNames = UIFont.familyNames
        
        for familyName in fontFamilyNames {
            print("Font Family: \(familyName)")
            
            let fontNames = UIFont.fontNames(forFamilyName: familyName)
            for fontName in fontNames {
                print("   \(fontName)")
            }
        }
    }
}
