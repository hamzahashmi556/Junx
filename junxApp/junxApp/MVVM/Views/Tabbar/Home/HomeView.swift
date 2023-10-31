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
                
                LazyVStack {
                    
                    StoryListView()
                    
                    NearYouView(width: reader.size.width - 40)
                    
                    NewMembersView()
                    
                    Spacer()
                }
            }
        }
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
        .padding(.top)
    }
    
    func NewMembersView() -> some View {
        
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
            
            ZStack {
                VStack(alignment: .leading) {
                    
                    Image(.sample1)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 76, height: 76)
                        .clipShape(Circle())
                    
                    Text("Hello World")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundStyle(.white)
                        .padding(.horizontal, 2)
                }
            }
            .frame(width: 106, height: 132)
            .background {
                Color.greyCard.clipShape(RoundedRectangle(cornerRadius: 10))
            }
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    HomeView()
}
