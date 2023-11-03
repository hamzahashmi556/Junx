//
//  MembersList.swift
//  junxApp
//
//  Created by Hamza Hashmi on 04/11/2023.
//

import SwiftUI

struct MembersList: View {
    
    @State var title: String
    
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        
        GeometryReader { geometry in
            
            ScrollView {
                
                TitleView(width: geometry.size.width)
                
                LazyVGrid(columns: [.init(), .init()], content: {
                    ForEach(0 ..< viewModel.users.count, id: \.self) { id in
                        MemberColoumn(user: viewModel.users[id], geometry: geometry)
                    }
                })
                .padding(.horizontal, 20)
                .padding(.top, 26)
            }
        }
        .navigationBarBackButtonHidden()
        .toolbar(content: {
            ToolbarItem(placement: .principal) {
                Image("text+image logo")
            }
            
            ToolbarItem(placement: .topBarLeading) {
                Image(systemName: "chevron.left")
            }
        })
        .toolbarTitleDisplayMode(.inline)
    }
    
    func TitleView(width: CGFloat) -> some View {
        ZStack {
            Text(title)
                .font(.customFont(name: .manuale, type: .semiBold, size: 24))
            
            HStack {
                
                Spacer()
                
                Image("add filters")
            }
            .padding(.trailing, 37)
        }
        .frame(width: width, height: 34)
        .padding(.top, 10)
    }
    
    func MemberColoumn(user: AppUser, geometry: GeometryProxy) -> some View {
        
        ZStack {
            
            Image(user.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: geometry.size.width * 0.43, height: 250)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            
            VStack(spacing: 2) {
                
                Spacer()
                
                Text(user.name)
                    .font(.customFont(name: .manuale, type: .semiBold, size: 18))
                
                HStack {
                    Image(.eye)
                    
                    Text("4.7K Views")
                        .font(.customFont(name: .inter, type: .regular, size: 12))
                    
                    Spacer()
                }
                .padding(.leading, 50)
                .padding(.bottom, 5)
            }
            .foregroundStyle(.white)
        }
        .frame(width: geometry.size.width * 0.43, height: 250)
    }
}

#Preview {
    NavigationView {
        MembersList(title: "New Members", viewModel: HomeViewModel())
    }
}
