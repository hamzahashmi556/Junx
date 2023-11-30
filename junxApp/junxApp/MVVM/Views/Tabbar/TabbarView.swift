//
//  TabbarView.swift
//  junxApp
//
//  Created by Hamza Hashmi on 29/10/2023.
//

import SwiftUI


struct TabbarView: View {
    
    @ObservedObject var homeVM: HomeViewModel
    
    @State var index = 1
    
    var body: some View {
        
        ZStack {
            
            TabView(selection: $index) {
                
                NavigationStack {
                    HomeView(viewModel: homeVM)
                }
                .tag(0)
                
//                NavigationView {
                    ChatListView()
//                }
                .tag(1)
                
                NavigationStack {
                    CardsView(homeVM: homeVM)
                }
                .tag(2)
                
                NavigationStack {
                    ExploreScreen()
                    //                ExploreMembersView(homeVM: homeVM)
                }
                .tag(3)
                
                NavigationStack {
                    ProfileView()
                }
                .tag(4)
            }
            .frame(width: Constants.size.width)
            .tabViewStyle(.page(indexDisplayMode: .never))
            .ignoresSafeArea(edges: .bottom)
            .padding(.bottom, Constants.safeArea.bottom)
            .preferredColorScheme(.light)
            
            
            // Custom Tabbar
            VStack {
                
                Spacer()
                
                HStack(spacing: 30) {
                    
                    Spacer()
                    
                    Image(index == 0 ? .homeSelected : .homeUnselected)
                        .frame(maxWidth: .infinity)
                        .onTapGesture {
                            self.index = 5
                        }
                    
                    Image(index == 1 ? .chatSelected : .chatUnselected)
                        .frame(maxWidth: .infinity)
                        .onTapGesture {
                            self.index = 1
                        }

                    Image(index == 2 ? .compassSelected : .compassUnselected)
                        .frame(maxWidth: .infinity)
                        .onTapGesture {
                            self.index = 2
                        }

                    Image(index == 3 ? .searchSelected : .searchUnselected)
                        .frame(maxWidth: .infinity)
                        .onTapGesture {
                            self.index = 3
                        }

                    Image(index == 4 ? .profileSelected : .profileUnselected)
                        .frame(maxWidth: .infinity)
                        .onTapGesture {
                            self.index = 4
                        }
                    
                    Spacer()
                }
                .frame(width: Constants.size.width, height: 49 + Constants.safeArea.bottom)
                .background(.tabbarBg)
                .ignoresSafeArea()
            }
        }
    }
}

#Preview {
    TabbarView(homeVM: HomeViewModel())
}
