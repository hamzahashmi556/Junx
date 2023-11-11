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
    private let threeColumnGrid = [
            GridItem(.flexible(), spacing: 0),
            GridItem(.flexible(), spacing: 0),
            GridItem(.flexible(), spacing: 0),
        ]
    @State var searchedText = ""
    @State var isSearching = false
    
    var body: some View {
        ZStack{
            WhiteBackground()
            VStack {
                
                SearchBar(text: $searchedText, isSearching: $isSearching)
                    .padding(.horizontal, 40)
                
                Text("Let’s Explore Our Community!")
                    .font(.customFont(name: .manuale, type: .semiBold, size: 24))
                    .foregroundStyle(.textMain)
                
                ScrollView {
                    LazyVGrid(columns: threeColumnGrid, spacing: 0, content: {
                        
                        ForEach(0 ... 15, id: \.self) { id in
                            let index = id % homeVM.users.count
                            UserView(user: homeVM.users[index])
                        }
                    })
                }
            }
            .toolbar(content: {
                ToolbarItem(placement: .topBarLeading) {
                    Image(systemName: "arrow.left")
                        .onTapGesture(perform: dismiss.callAsFunction)
                }
                
                ToolbarItem(placement: .principal) {
                    Image("text+image logo")
                }
            })
            .toolbarTitleDisplayMode(.inline)
        }
       
    }
    
    func UserView(user: AppUser) -> some View {
        
        let width = Constants.size.width / 3
        return ZStack {
            
            Image(user.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: width, height: width)
                .scaledToFill()
                .clipShape(RoundedRectangle(cornerRadius: 5))
            
            VStack {
                
                Spacer()
                
                Text(user.name)
                    .font(.customFont(name: .manuale, type: .bold, size: 14))
                    .lineLimit(1)
                    .padding(.horizontal)
                    .offset(y:10)
                    
                
                HStack {
                    Image("eye")
                    
                    Text("4.7K Views")
                        .font(.customFont(name: .inter, type: .regular, size: 12))
                }
                .padding(.bottom, 5)
                .padding(.horizontal)
            }
        }
        .frame(width: width, height: width)
        .foregroundStyle(.white)
        .multilineTextAlignment(.leading)
    }
}

#Preview {
//    NavigationView {
//        ExploreMembersView(homeVM: HomeViewModel())
//    }
    TabbarView(homeVM: HomeViewModel(), index: 3)
}
