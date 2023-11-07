//
//  CardsView.swift
//  junxApp
//
//  Created by Hamza Hashmi on 29/10/2023.
//

import SwiftUI

struct CardsView: View {
    
    @ObservedObject var homeVM: HomeViewModel
    
    var body: some View {
        
        GeometryReader { reader in
            VStack {
                
                Text("Lets Explore!")
                    .font(.customFont(name: .manuale, type: .semiBold, size: 24))
                
                HStack(alignment: .bottom) {
                    
                    Spacer()
                    
                    ZStack(alignment: .top) {
                        
                        ForEach(0 ..< homeVM.users.count, id: \.self) { id in
                            
                            let width = reader.size.width - 30
                            let height: CGFloat = 508
                            
                            let isLastUser = id == homeVM.users.count - 1
                            
                            let newWidth = isLastUser ? width : width - 50
                            let newHeight = isLastUser ? height - 20 : height
                            
                            CardView(width: newWidth, height: newHeight, user: homeVM.users[id])
                        }
                    }
                    Spacer()
                }
                
                Spacer()
            }
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Image("text+image logo")
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Image("header")
            }
        }
    }
    
    
    func CardView(width: CGFloat, height: CGFloat, user: AppUser) -> some View {
        ZStack(alignment: .center) {
            
            VStack {
                
                Image(user.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 379)
                    .scaledToFill()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding([.horizontal, .top], 10)
                
                Spacer()
                
                HStack(spacing: 44) {
                    
                    self.CircleButton(image: .closeFill)
                    
                    self.CircleButton(image: .heartFill, circleColor: .greenTheme)
                    
                    self.CircleButton(image: .starFill)
                    
                }
                .padding(.bottom, 25)
            }
            
            VStack {
                HStack {
                    
                    Text("2.5 KM Away")
                        .frame(height: 38)
                        .padding(.horizontal)
                        .background {
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundStyle(.white.opacity(0.5))
                            
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(lineWidth: 2)
                                .foregroundStyle(.white)
                        }
                    
                    Spacer()
                    
                    ZStack {
                        
                        Circle()
                            .stroke(lineWidth: 5)
                            .foregroundStyle(.white.opacity(0.5))
                        
                        Circle()
                            .trim(from: 0.8, to: 1)
                            .stroke(lineWidth: 5)
                            .foregroundStyle(.white)
                            .rotationEffect(.degrees(90))
                        
                        
                        Text("80%")
                            .font(.customFont(name: .inter, type: .regular, size: 14))
                    }
                    .frame(width: 45, height: 45)
                    .padding(.trailing, 25)
                }
                .padding([.top, .leading], 15)
                
                Spacer()
            }
        }
        .frame(width: width, height: height)
        .background {
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(.white)
                .shadow(radius: 10)
        }
    }
    
    func CircleButton(image: ImageResource, circleColor: Color = .white) -> some View {
        ZStack {
            Circle()
                .foregroundStyle(circleColor)
                .shadow(radius: 10)
            
            Image(image)
        }
        .frame(width: 55, height: 55)
    }
}

#Preview {
    TabbarView(homeVM: HomeViewModel(), index: 2)
}
