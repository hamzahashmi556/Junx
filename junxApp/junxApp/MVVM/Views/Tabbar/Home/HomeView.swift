//
//  HomeView.swift
//  junxApp
//
//  Created by Hamza Hashmi on 29/10/2023.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        
        ScrollView {
            
            VStack(spacing: 0) {
                
                TitleView()
                
                StoryListView()
                
                NearYouView(width: Constants.size.width - 40)
                
                NewMembersView()
                
                Spacer()
                
            }
        }
        .toolbar(.visible, for: .navigationBar)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Image(.menu)
            }
            
            ToolbarItem(placement: .principal) {
                Image("text+image logo")
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                HStack {
                    Image(.heart)
                    Image(.notification)
                }
            }
        }
        .toolbarTitleDisplayMode(.inline)
    }
    
    func TitleView() -> some View {
        HStack {
            Image("location")
            
            Text("Rawalpindi, Pakistan")
                .font(.system(size: 14))
                .foregroundStyle(.textSecondary)
        }
        .padding(.top, 15)
        .padding(.bottom, 30)
    }
    
    func NearYouView(width: CGFloat) -> some View {
        
        VStack(alignment: .leading) {
            
            HStack {
                
                Text("Near You")
                    .font(.customFont(name: .manuale, type: .semiBold, size: 24))
                    .foregroundStyle(.textMain)
                
                Spacer()
                
                NavigationLink {
                    MembersList(viewModel: self.viewModel, title: "Near You")
                } label: {
                    Text("View All")
                        .font(.customFont(name: .inter, type: .medium, size: 16))
                        .foregroundStyle(.greenTheme)
                        .underline()
                }
            }
            
            ZStack {
                ForEach(0 ..< viewModel.users.count, id: \.self) { id in
                    
                    HStack {
                        
                        ZStack {
                            
                            Image(viewModel.users[id].image)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: width - CGFloat(id * 10), height: 330 - CGFloat((viewModel.users.count - id) * 10))
                                .scaledToFill()
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .onAppear(perform: {
                                    debugPrint("\n Width:")
                                    debugPrint(width - CGFloat(id * 10))
                                    debugPrint("Width: \n")
                                })
                            
                            VStack {
                                
                                HStack {
                                    
                                    Spacer()
                                    
                                    Text("2.5km")
                                        .font(.customFont(name: .inter, type: .regular, size: 14))
                                        .padding(.trailing, 20)
                                        .padding(.top, 20)
                                        .foregroundStyle(.white)
                                }
                                
                                Spacer()
                                
                                HStack {
                                    
                                    VStack(alignment: .leading, spacing: 16) {
                                        Text("Nico Robin, 24")
                                            .font(.customFont(name: .manuale, type: .semiBold, size: 18))
                                        
                                        Text("Waiting for someone who would be my best partner ")
                                            .font(.customFont(name: .inter, type: .regular, size: 14))
                                    }
                                    .padding([.leading, .bottom], 20)
                                    .foregroundStyle(.white)
                                    
                                    Spacer()
                                }
                            }
                        }
                        .frame(width: width - CGFloat(id * 10), height: 330 - CGFloat((viewModel.users.count - id) * 10))

                        Spacer()
                    }
                }
            }
        }
        .frame(width: width, height: width, alignment: .leading)
        .padding(.top, 25)
    }
    
    func NewMembersView() -> some View {
        
        VStack {
            
            HStack {
                
                Text("New Members")
                    .font(.customFont(name: .manuale, type: .semiBold, size: 24))
                    .foregroundStyle(.textMain)
                
                Spacer()
                
                NavigationLink {
                    MembersList(viewModel: self.viewModel, title: "New Members")
                } label: {
                    Text("View All")
                        .font(.customFont(name: .inter, type: .medium, size: 16))
                        .foregroundStyle(.greenTheme)
                        .underline()
                }
            }
            
            LazyVGrid(columns: [.init(), .init(), .init()], content: {
                ForEach(0..<5, id: \.self) { id in
                    NewMemberCard(image: .sample1, title: "ABC", width: Constants.size.width / 3.65)
                }
            })
        }
        .padding(.horizontal, 20)
        .padding(.top, 25)
    }
}

struct NewMemberCard: View {
    
    var image: ImageResource
    var title: String
    
    var width: CGFloat
    
    var body: some View {
        ZStack {
            VStack(alignment: .center, spacing: 0) {
                
                
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 76, height: 76)
                    .clipShape(Circle())
                    .padding(.top, 15)
                
                Text(title)
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundStyle(.white)
                    .padding(.horizontal, 2)
                    .padding(.top, 11.0)
                    .padding(.bottom, 13)
                    
                
            }
        }
        .frame(width: width, height: 132)
        .background {
            Color.greyCard.clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}

#Preview {
    TabbarView(homeVM: HomeViewModel())
}
