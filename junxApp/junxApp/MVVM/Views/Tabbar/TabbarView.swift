//
//  TabbarView.swift
//  junxApp
//
//  Created by Hamza Hashmi on 29/10/2023.
//

import SwiftUI


struct TabbarView: View {
    
    @ObservedObject var homeVM: HomeViewModel
    
    @State var index = 0
    
    var body: some View {
        TabView(selection: $index) {
            NavigationStack {
                HomeView(viewModel: homeVM)
            }
            .tag(0)
            .tabItem {
                Label("", image: index == 0 ? .homeSelected : .homeUnselected)
            }
            NavigationStack {
                ChatListView()
            }
            .tag(1)
            .tabItem {
                Label("", image: index == 1 ? .chatSelected : .chatUnselected)
            }
            
            NavigationStack {
                CardsView(homeVM: homeVM)
            }
            .tag(2)
            .tabItem {
                Label("", image: index == 2 ? .compassSelected : .compassUnselected)
            }
            
            NavigationStack {
//                ExploreScreen()
                ExploreMembersView(homeVM: homeVM)
            }
            .tag(3)
            .tabItem {
                Label("", image: index == 3 ? .searchSelected : .searchUnselected)
            }
            
            NavigationStack {
                ProfileView()
            }
            .tag(4)
            .tabItem {
                Label("", image: index == 4 ? .profileSelected : .profileUnselected)
            }
        }
        .preferredColorScheme(.light)
    }
}

#Preview {
    TabbarView(homeVM: HomeViewModel())
}
