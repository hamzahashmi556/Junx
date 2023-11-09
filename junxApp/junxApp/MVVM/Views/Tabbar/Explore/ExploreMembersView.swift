//
//  ExploreMembersView.swift
//  junxApp
//
//  Created by Hamza Hashmi on 09/11/2023.
//

import SwiftUI

struct ExploreMembersView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var homeVM: HomeViewModel
    
    var body: some View {
        VStack {
            Text("Hello, World!")
        }
        .toolbar(content: {
            ToolbarItem(placement: .topBarLeading) {
                Image(systemName: "arrow.left")
                    .onTapGesture(perform: dismiss.callAsFunction)
            }
        })
    }
}

#Preview {
    ExploreMembersView(homeVM: HomeViewModel())
}
