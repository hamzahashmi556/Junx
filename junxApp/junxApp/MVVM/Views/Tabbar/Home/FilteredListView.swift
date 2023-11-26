//
//  FilteredListView.swift
//  junxApp
//
//  Created by apple on 26/11/2023.
//

import SwiftUI

struct FilteredListView: View {
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var viewModel: HomeViewModel
    
    @State var title: String
    
    var body: some View {
        ZStack{
            WhiteBackground()
            ScrollView {
                
                if viewModel.isFilterApplied {
                    HStack {
                        
                        filterView(image: .filterGender, isSelected: viewModel.filterType == .gender)
                        
                        Spacer()
                        
                        filterView(image: .filterLocation, isSelected: viewModel.filterType == .location)
                        
                        Spacer()
                       
                        filterView(image: .filterDistance, isSelected: viewModel.filterType == .distance)
                       
                    }.padding(.top,30)
                        .padding(.horizontal, 25)
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
                .padding(.top, 15)
            }
            .navigationBarBackButtonHidden()
            .toolbar(content: {
                ToolbarItem(placement: .principal) {
                    Image("text+image logo")
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    Image("Back")
                        .padding(.leading,10)
                        .onTapGesture {
                            self.dismiss.callAsFunction()
                        }
                }
                ToolbarItem(placement: .topBarTrailing){
                    Image("header")
                        .padding(.trailing,10)
                }
               
            })
            .toolbarTitleDisplayMode(.inline)
            .sheet(isPresented: $viewModel.isPresentExplore, content: {
                FindFriendsView(homeVM: viewModel)
            })
           
            
            if viewModel.isPresentAddFilter {
                Color.black.opacity(0.5).ignoresSafeArea()
            }
        }
       
        
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

#Preview {
    NavigationView {
        FilteredListView(viewModel: HomeViewModel(), title: "New Members")
    }
    
}
