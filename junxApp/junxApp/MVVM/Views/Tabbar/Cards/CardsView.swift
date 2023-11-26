//
//  CardsView.swift
//  junxApp
//
//  Created by Hamza Hashmi on 29/10/2023.
//

import SwiftUI

struct CardsView: View {
    
    @ObservedObject var homeVM: HomeViewModel
    
    private var maxID: Int {
        return self.homeVM.users.map { $0.id }.max() ?? 0
    }
    
    var body: some View {
        ZStack{
            WhiteBackground()
            GeometryReader { reader in
                
                VStack {
                    
                    Text("Lets Explore!")
                        .font(.customFont(name: .manuale, type: .semiBold, size: 24))
                        .foregroundStyle(.textMain)
                        .padding(.vertical,30)
                    
                    HStack(alignment: .bottom) {
                        
                        Spacer()
                        
                        ZStack(alignment: .top) {
                            
                            ForEach(homeVM.users, id: \.id) { user in
                                if (self.maxID - 3)...self.maxID ~= user.id {
                                    CardView(user: user) { removedUser in
                                        // Remove that user from our array
                                        self.homeVM.users.removeAll(where: { $0.id == removedUser.id })
                                    }
                                    .animation(.spring())
                                    .frame(width: self.getCardWidth(reader, id: user.id), height: 490)
                                    .offset(x: 0, y: self.getCardOffset(reader, id: user.id))
                                }
                            }
                            /*
                            ForEach(0 ..< homeVM.users.count, id: \.self) { id in
                                

                                
                                let width = reader.size.width - 30
                                let height: CGFloat = 508
                                
                                let isLastUser = id == homeVM.users.count - 1
                                
                                let newWidth = isLastUser ? width : width - 50
                                let newHeight = isLastUser ? height - 20 : height
                                
                                CardView(width: newWidth, height: newHeight, user: homeVM.users[id])
                            }
                             */
                        }
                        Spacer()
                    }
                    
                    Spacer()
                }
            }
           
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(.visible, for: .navigationBar)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    //dismiss.callAsFunction()
                } label: {
                    Image("Back")
                        .padding(.leading,10)
                }
            }
            ToolbarItem(placement: .principal) {
                Image("text+image logo")
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Image("header")
                    .padding(.trailing,10)
            }
        }
       
    }
    
    private func getCardWidth(_ geometry: GeometryProxy, id: Int) -> CGFloat {
        let users = homeVM.users
        let offset: CGFloat = CGFloat(users.count - 1 - id) * 10
        return geometry.size.width - offset
    }

    private func getCardOffset(_ geometry: GeometryProxy, id: Int) -> CGFloat {
        let users = homeVM.users
        return  CGFloat(users.count - 1 - id) * 10
    }
}

struct CardView: View {
    
    @State var swipeStatus: LikeDislike = .none
    @State var translation: CGSize = .zero
    
    @State public var user: AppUser
    @State public var onRemove: (_ user: AppUser) -> Void
    
    var thresholdPercentage: CGFloat = 0.5 // when the user has draged 50% the width of the screen in either direction
    
    enum LikeDislike: Int {
        case like, dislike, none
    }
    
    var body: some View {
        GeometryReader { geometry in
            
            ZStack(alignment: .center) {
                
                RoundedRectangle(cornerRadius: 20)
                    .foregroundStyle(.white)
                    .shadow(radius: 10)
                
                VStack {
                    
                    Image(user.image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 379)
                        .scaledToFill()
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .padding([.horizontal, .top], 10)
                        .overlay(
                            VStack{
                                Spacer()
                                UnevenRoundedRectangle(cornerRadii: RectangleCornerRadii(
                                    topLeading: 0,
                                    bottomLeading: 20,
                                    bottomTrailing: 20,
                                    topTrailing: 0)
                                )
                                .foregroundStyle(.black.opacity(0.65))
                                .frame(height: 85, alignment: .bottom)
                                .padding(.horizontal,10)
                                .overlay(
                                    VStack{
                                        HStack{
                                            Text("Bred Jackson, 25")
                                                .font(.customFont(name: .manuale, type: .regular, size: 24))
                                                .foregroundStyle(.whiteonly)
                                            Spacer()
                                        }
                                        HStack{
                                            Text("Photographer")
                                                .font(.customFont(name: .inter, type: .regular, size: 14))
                                                .foregroundStyle(.whiteonly)
                                            Spacer()
                                        }
                                        Spacer()
                                    }.padding(.leading,35)
                                        .padding(.top,10)
                                )
                            }
                        )
                    
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
                            .font(.customFont(name: .inter, type: .regular, size: 14))
                           // .foregroundStyle(.whiteonly)
                            .frame(height: 38)
                            .padding(.horizontal)
                            .background {
                                RoundedRectangle(cornerRadius: 20)
                                    .foregroundStyle(.white.opacity(0.5))
                                
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(lineWidth: 2)
                                    .foregroundStyle(.white)
                            }.padding(.leading,5)
                        
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
                        .padding(.trailing, 5)
                    }
                    .padding(.top, 22)
                    
                    Spacer()
                }
                .padding(.horizontal)
            }
            .padding(.trailing)
            .padding(.horizontal, 20)
            .animation(.interactiveSpring())
            .offset(x: self.translation.width, y: 0)
            .rotationEffect(.degrees(Double(self.translation.width / geometry.size.width) * 25), anchor: .bottom)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        self.translation = value.translation
                        
                        if (self.getGesturePercentage(geometry, from: value)) >= self.thresholdPercentage {
                            self.swipeStatus = .like
                        } else if self.getGesturePercentage(geometry, from: value) <= -self.thresholdPercentage {
                            self.swipeStatus = .dislike
                        } else {
                            self.swipeStatus = .none
                        }
                        
                }.onEnded { value in
                    // determine snap distance > 0.5 aka half the width of the screen
                        if abs(self.getGesturePercentage(geometry, from: value)) > self.thresholdPercentage {
                            self.onRemove(self.user)
                        } else {
                            self.translation = .zero
                        }
                    }
            )
        }
    }
    
    private func getGesturePercentage(_ geometry: GeometryProxy, from gesture: DragGesture.Value) -> CGFloat {
        gesture.translation.width / geometry.size.width
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
    NavigationView {
        GeometryReader { geometry in
            CardsView(homeVM: HomeViewModel())
        }
    }
}
