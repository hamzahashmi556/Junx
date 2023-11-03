//
//  HomeView.swift
//  junxApp
//
//  Created by Hamza Hashmi on 29/10/2023.
//

import SwiftUI

struct HomeView: View {
    
    @State var users: [AppUser] = [
        .init(name: "Arthur Morgan", description: "Lorem Ipsum Dolor Ismit", image: .sample5),
        .init(name: "Ezio Auditore Da Firenze", description: "Requescat in Pace", image: .sample4),
        .init(name: "Master Chief", description: "Halo The Master Chief Collection", image: .sample3),
        .init(name: "John Marston", description: "Lorem Ipsum Dolor Ismit", image: .sample2),
        .init(name: "Lara Croft", description: "Lorem Ipsum Dolor Ismit", image: .sample4)
    ]
    
    var body: some View {
        
        GeometryReader { reader in
            
            ScrollView {
                
                VStack(spacing: 0) {
                    
                    TitleView()
                    
                    StoryListView()
                    
                    NearYouView(width: reader.size.width - 40)
                    
                    NewMembersView(geometry: reader)
                    
                    Spacer()
                    
                }
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
                
                Text("View All")
                    .font(.customFont(name: .inter, type: .medium, size: 16))
                    .foregroundStyle(.greenTheme)
                    .underline()
                    
            }
            
            ZStack {
                ForEach(0 ..< users.count, id: \.self) { id in
                    
                    HStack {
                        
                        ZStack {
                            
                            Image(users[id].image)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: width - CGFloat(id * 10), height: 330 - CGFloat((users.count - id) * 10))
                                .scaledToFill()
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                            
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
                        .frame(width: width - CGFloat(id * 10), height: 330 - CGFloat((users.count - id) * 10))

                        Spacer()
                    }
                }
            }
        }
        .frame(width: width, height: width, alignment: .leading)
        .padding(.top, 25)
    }
    
    func NewMembersView(geometry: GeometryProxy) -> some View {
        
        VStack {
            
            HStack {
                
                Text("New Members")
                    .font(.customFont(name: .manuale, type: .semiBold, size: 24))
                    .foregroundStyle(.textMain)
                
                Spacer()
                
                Text("View All")
                    .font(.customFont(name: .inter, type: .medium, size: 16))
                    .foregroundStyle(.greenTheme)
                    .underline()
            }
            
            LazyVGrid(columns: [.init(), .init(), .init()], content: {
                ForEach(0..<5, id: \.self) { id in
                    NewMemberCard(image: .sample1, title: "ABC", width: geometry.size.width / 3.65)
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
    TabbarView()
}
