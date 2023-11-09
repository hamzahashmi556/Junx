//
//  SearchBar.swift
//  junxApp
//
//  Created by Hamza Hashmi on 09/11/2023.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var text: String
    @Binding var isSearching: Bool

    var body: some View {
        
        HStack {
            
            Image("search")
                .padding()
            
            TextField("Search", text: $text)
            
            Button(action: {
                text = ""
                isSearching = false
            }) {
                Image(systemName: "xmark.circle.fill")
                    .foregroundColor(.gray)
            }
            .padding(8)
            .opacity(text.isEmpty ? 0 : 1)
        }
        .background {
            RoundedRectangle(cornerRadius: 15)
                .stroke()
                .foregroundStyle(.tfBorder)
        }
        .padding(10)
        
    }
}

#Preview {
    SearchBar(text: .constant("Search Bar"), isSearching: .constant(true))
}
