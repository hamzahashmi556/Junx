//
//  TabbarView.swift
//  junxApp
//
//  Created by Hamza Hashmi on 29/10/2023.
//

import SwiftUI


struct TabbarView: View {
    
    @State var index = 0
    
    var body: some View {
        
        TabView(selection: $index) {
            HomeView()
                .tag(0)
                .tabItem {
                    Image(index == 0 ? .homeSelected : .homeUnselected)
                }
            
            ChatView()
                .tag(1)
                .tabItem {
                    Image(index == 1 ? .chatSelected : .chatUnselected)
                }
            
            CardsView()
                .tag(2)
                .tabItem {
                    Image(index == 2 ? .compassSelected : .compassUnselected)
                }
            
            SearchView()
                .tag(3)
                .tabItem {
                    Image(index == 3 ? .searchSelected : .searchUnselected)
                }
            
            ProfileView()
                .tag(4)
                .tabItem {
                    Image(index == 4 ? .profileSelected : .profileUnselected)
                }
        }
    }
}

#Preview {
    TabbarView()
}
