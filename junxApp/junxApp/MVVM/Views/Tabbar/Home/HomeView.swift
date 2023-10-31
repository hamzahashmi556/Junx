//
//  HomeView.swift
//  junxApp
//
//  Created by Hamza Hashmi on 29/10/2023.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        
        ScrollView {
            LazyVStack {
                
                StoryListView()
                
                Spacer()
            }
        }
    }
}

#Preview {
    HomeView()
}
