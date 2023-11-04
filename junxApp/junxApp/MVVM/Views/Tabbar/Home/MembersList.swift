//
//  MembersList.swift
//  junxApp
//
//  Created by Hamza Hashmi on 04/11/2023.
//

import SwiftUI

struct MembersList: View {
    
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var viewModel: HomeViewModel
    
    @State var title: String
    
    var body: some View {
        
        ScrollView {
            
            if viewModel.isFilterApplied {
                HStack {
                    filterView(image: .filterGender, isSelected: viewModel.filterType == .gender)
                    
                    filterView(image: .filterLocation, isSelected: viewModel.filterType == .location)

                    filterView(image: .filterDistance, isSelected: viewModel.filterType == .distance)
                }
            }
            else {
                TitleView()
            }
            
            LazyVGrid(columns: [.init(), .init()], content: {
                ForEach(0 ..< viewModel.users.count, id: \.self) { id in
                    MemberColoumn(user: viewModel.users[id])
                }
            })
            .padding(.horizontal, 20)
            .padding(.top, 26)
        }
        .navigationBarBackButtonHidden()
        .toolbar(content: {
            ToolbarItem(placement: .principal) {
                Image("text+image logo")
            }
            
            ToolbarItem(placement: .topBarLeading) {
                Image(systemName: "chevron.left")
                    .onTapGesture {
                        self.dismiss.callAsFunction()
                    }
            }
        })
        .toolbarTitleDisplayMode(.inline)
        .sheet(isPresented: $viewModel.isPresentExplore, content: {
            ExploreView(homeVM: viewModel)
        })
        .sheet(isPresented: $viewModel.isPresentAddFilter, content: {
            AddFilterView(homeVM: viewModel)
        })
        
    }
    
    func TitleView() -> some View {
        ZStack {
            Text(title)
                .font(.customFont(name: .manuale, type: .semiBold, size: 24))
            
            HStack {
                
                Spacer()
                
                Button {
                    self.viewModel.isPresentAddFilter.toggle()
                } label: {
                    Image(.addFilters)
                }
            }
            .padding(.trailing, 37)
        }
        .frame(width: Constants.size.width, height: 34)
        .padding(.top, 10)
    }
    
    func filterBar(imageName: String) -> some View {
        HStack {
            
        }
    }
    
    func filterView(image: ImageResource, isSelected: Bool) -> some View {
        ZStack {
            if isSelected {
                Color.greenTheme.clipShape(RoundedRectangle(cornerRadius: 25))
            }
            else {
                RoundedRectangle(cornerRadius: 25).stroke()
            }
            
            Image(image)
        }
        .frame(width: 79, height: 35)
    }
}

struct MemberColoumn: View {
    
    @State var user: AppUser
    
    var body: some View {
        ZStack {
            
            Image(user.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: Constants.size.width * 0.43, height: 250)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            
            VStack(spacing: 2) {
                
                Spacer()
                
                Text(user.name)
                    .font(.customFont(name: .manuale, type: .semiBold, size: 18))
                    .multilineTextAlignment(.center)
                
                HStack {
                    Image(.eye)
                    
                    Text("4.7K Views")
                        .font(.customFont(name: .inter, type: .regular, size: 12))
                }
                .padding(.bottom, 5)
            }
            .foregroundStyle(.white)
        }
        .frame(width: Constants.size.width * 0.43, height: 250)
        
    }
}

#Preview {
    NavigationView {
        MembersList(viewModel: HomeViewModel(), title: "New Members")
    }
}
