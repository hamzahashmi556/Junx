//
//  KeyboardView.swift
//  junxApp
//
//  Created by Hamza Hashmi on 22/10/2023.
//

import SwiftUI

struct KeyboardView: View {
    
    @State private var coloumns = [GridItem(), GridItem(), GridItem()]
    
    @State private var keys = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "", "0", "x"]
    
    @State public var keyPressed: (String) -> Void
    
    var body: some View {
        ZStack {
            
            LazyVGrid(columns: coloumns, spacing: 24) {
                ForEach(0 ..< keys.count, id: \.self) { index in
                    keyView(key: keys[index])
                }
            }
            .padding(.horizontal, 15)
        }
    }
    
    func keyView(key: String) -> some View {
        Button {
            keyPressed(key)
        } label: {
            HStack {
                if key == "x" {
                    Image(systemName: "delete.left")
                }
                else {
                    Text(key)
                }
            }
            .frame(maxWidth: .infinity, minHeight: 36)
            .font(.customFont(name: .skModernist, type: .regular, size: 24))
            .foregroundStyle(.textMain)
        }
    }
}

#Preview {
    KeyboardView { key in
        debugPrint(key)
    }
}
