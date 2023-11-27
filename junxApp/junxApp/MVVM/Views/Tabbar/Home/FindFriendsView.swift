//
//  FindFriendsView.swift
//  junxApp
//
//  Created by Hamza Hashmi on 05/11/2023.
//

import SwiftUI

struct FindFriendsView: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var homeVM: HomeViewModel
    
    private var maxID: Int {
        return self.homeVM.users.map { $0.id }.max() ?? 0
    }
    
    var body: some View {
        
        ZStack {
            
            WhiteBackground()
            GeometryReader { reader in
                VStack(spacing: 0) {
                   
                    // Title
                    HStack(alignment: .bottom) {
                        Text("Find Friends")
                            .font(.customFont(name: .manuale, type: .semiBold, size: 24))
                            .foregroundStyle(.textMain)
                    }
                    .padding(.top, 35)
                    .frame(height: 35)
                    Spacer()
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
                        }
                        Spacer()
                    }
                    Spacer()
                    //  UserCardsView2(width: Constants.size.width - 32)
                  
                    
//                    ZStack(alignment: .center) {
//                        
//                        Image(.heartGreenCircle)
//                            .offset(x: -65)
//                        
//                        Button(action: {
//                            dismiss.callAsFunction()
//                        }, label: {
//                            Image(.closeGreenCircle)
//                        })
//                        .offset(x: 65, y: 7)
//                    }
//                    .frame(height: 115, alignment: .center)
//                    .padding(.bottom)
                    
                    Text("Find friends nearby")
                        .font(.customFont(name: .inter, type: .regular, size: 14))
                        .foregroundStyle(.textSecondary)
                        .padding(.top, 17)
                        .opacity(0)
                }
            }
        }
        .presentationDetents([.height(Constants.size.height * 0.75)])
        .presentationCornerRadius(30)
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
    
    func UserCardsView(width: CGFloat) -> some View {
        
        VStack(alignment: .center) {
            
            ZStack {
                ForEach(0 ..< homeVM.users.count, id: \.self) { id in
                    
                    let width = width - CGFloat(id * 16)
                    let height = Constants.size.height * 0.5 - CGFloat((homeVM.users.count - id) * 21)
                    
                    HStack {
                        
                        ZStack {
                            
                            Image(homeVM.users[id].image)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: width, height: height)
                                .scaledToFill()
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                               
                            
                            if id == homeVM.users.count - 1 {
                               
                                    VStack {
                                        
                                        Spacer()
                                        
                                        UnevenRoundedRectangle(cornerRadii: RectangleCornerRadii(
                                            topLeading: 0,
                                            bottomLeading: 25,
                                            bottomTrailing: 25,
                                            topTrailing: 0)
                                        )
                                        .foregroundStyle(.greenTheme.opacity(0.65))
                                        .frame(height: 85, alignment: .bottom)
                                    }
                                    
                                    
                                    VStack {
                                        
                                        Spacer()
                                        
                                        HStack(alignment: .bottom) {
                                            
                                            VStack(alignment: .leading, spacing: 0) {
                                                
                                                Text("\(homeVM.users[id].name)")
                                                    .font(.customFont(name: .inter, type: .bold, size: 18))
                                                
                                                Text("\(homeVM.users[id].username)")
                                                    .font(.customFont(name: .inter, type: .regular, size: 14))
                                            }
                                            .padding(.leading, 20)
                                            .foregroundStyle(.white)
                                            
                                            Spacer()
                                            
                                            HStack(alignment: .bottom) {
                                                VStack(alignment: .leading, content: {
                                                    Text("\(homeVM.users[id].friends)")
                                                        .font(.customFont(name: .inter, type: .bold, size: 14))
                                                    
                                                    Text("Friends")
                                                        .font(.customFont(name: .inter, type: .regular, size: 12))
                                                })
                                                
                                                Rectangle()
                                                    .frame(width: 1, height: 30)
                                                    .foregroundStyle(.white)
                                                
                                                VStack {
                                                    Text("\(homeVM.users[id].followers)")
                                                        .font(.customFont(name: .inter, type: .bold, size: 14))
                                                    
                                                    Text("Friends")
                                                        .font(.customFont(name: .inter, type: .regular, size: 12))
                                                }
                                                .padding(.trailing, 16)
                                            }
                                            .foregroundStyle(.white)
                                        }
                                        .frame(height: 85, alignment: .bottom)
                                        .padding(.bottom, 20)
                                    }
                                
                                
                               
                            }
                        }
                        .frame(width: width, height: 465 - CGFloat((homeVM.users.count - id) * 15))
                    }
                }
            }
            .frame(width: width, height: Constants.size.height * 0.55, alignment: .center)
            .padding(.vertical, 12)
        }
    }
    
    func UserCardsView2(width: CGFloat) -> some View {
        
        VStack(alignment: .center) {
            
            ZStack {
                ForEach(0 ..< homeVM.users.count, id: \.self) { id in
                    
                    let width = width - CGFloat(id * 16)
                    let height = Constants.size.height * 0.5 - CGFloat((homeVM.users.count - id) * 21)
                    
                    HStack {
                        
                        ZStack {
                            
                            Image(homeVM.users[id].image)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: width, height: height)
                                .scaledToFit()
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .overlay(
                                    Group{
                                        if id == homeVM.users.count - 1 {
                                            
                                            VStack{
                                                Spacer()
                                                ZStack{
                                                    UnevenRoundedRectangle(cornerRadii: RectangleCornerRadii(
                                                        topLeading: 0,
                                                        bottomLeading: 25,
                                                        bottomTrailing: 25,
                                                        topTrailing: 0)
                                                    )
                                                    .foregroundStyle(.greenTheme.opacity(0.65))
                                                    .frame(height: 85, alignment: .bottom)
                                                    
                                                    
                                                    
                                                    
                                                    HStack(alignment: .bottom) {
                                                        
                                                        VStack(alignment: .leading, spacing: 0) {
                                                            
                                                            Text("\(homeVM.users[0].name)")
                                                                .font(.customFont(name: .inter, type: .bold, size: 18))
                                                            
                                                            Text("\(homeVM.users[0].username)")
                                                                .font(.customFont(name: .inter, type: .regular, size: 14))
                                                        }
                                                        .padding(.leading, 20)
                                                        .foregroundStyle(.white)
                                                        
                                                        Spacer()
                                                        
                                                        HStack(alignment: .bottom) {
                                                            VStack(alignment: .leading, content: {
                                                                Text("\(homeVM.users[0].friends)")
                                                                    .font(.customFont(name: .inter, type: .bold, size: 14))
                                                                
                                                                Text("Friends")
                                                                    .font(.customFont(name: .inter, type: .regular, size: 12))
                                                            })
                                                            
                                                            Rectangle()
                                                                .frame(width: 1, height: 30)
                                                                .foregroundStyle(.white)
                                                            
                                                            VStack {
                                                                Text("\(homeVM.users[0].followers)")
                                                                    .font(.customFont(name: .inter, type: .bold, size: 14))
                                                                
                                                                Text("Friends")
                                                                    .font(.customFont(name: .inter, type: .regular, size: 12))
                                                            }
                                                            .padding(.trailing, 16)
                                                        }
                                                        .foregroundStyle(.white)
                                                    }
                                                    .frame(height: 85, alignment: .bottom)
                                                    .padding(.bottom, 20)
                                                    
                                                }
                                                
                                            }.offset(y:10)
                                        }
                                    }
                                    
                                )
                               
                            /*
                            if id == homeVM.users.count - 1 {
                               
                                    VStack {
                                        
                                        Spacer()
                                        
                                        UnevenRoundedRectangle(cornerRadii: RectangleCornerRadii(
                                            topLeading: 0,
                                            bottomLeading: 25,
                                            bottomTrailing: 25,
                                            topTrailing: 0)
                                        )
                                        .foregroundStyle(.greenTheme.opacity(0.65))
                                        .frame(height: 85, alignment: .bottom)
                                    }
                                    
                                    
                                    VStack {
                                        
                                        Spacer()
                                        
                                        HStack(alignment: .bottom) {
                                            
                                            VStack(alignment: .leading, spacing: 0) {
                                                
                                                Text("\(homeVM.users[id].name)")
                                                    .font(.customFont(name: .inter, type: .bold, size: 18))
                                                
                                                Text("\(homeVM.users[id].username)")
                                                    .font(.customFont(name: .inter, type: .regular, size: 14))
                                            }
                                            .padding(.leading, 20)
                                            .foregroundStyle(.white)
                                            
                                            Spacer()
                                            
                                            HStack(alignment: .bottom) {
                                                VStack(alignment: .leading, content: {
                                                    Text("\(homeVM.users[id].friends)")
                                                        .font(.customFont(name: .inter, type: .bold, size: 14))
                                                    
                                                    Text("Friends")
                                                        .font(.customFont(name: .inter, type: .regular, size: 12))
                                                })
                                                
                                                Rectangle()
                                                    .frame(width: 1, height: 30)
                                                    .foregroundStyle(.white)
                                                
                                                VStack {
                                                    Text("\(homeVM.users[id].followers)")
                                                        .font(.customFont(name: .inter, type: .bold, size: 14))
                                                    
                                                    Text("Friends")
                                                        .font(.customFont(name: .inter, type: .regular, size: 12))
                                                }
                                                .padding(.trailing, 16)
                                            }
                                            .foregroundStyle(.white)
                                        }
                                        .frame(height: 85, alignment: .bottom)
                                        .padding(.bottom, 20)
                                    }
                                
                                
                               
                            }
                             */
                        }
                        .frame(width: width, height: 465 - CGFloat((homeVM.users.count - id) * 15))
                    }
                }
            }
            .frame(width: width, height: Constants.size.height * 0.55, alignment: .center)
            .padding(.vertical, 12)
        }
    }
}

#Preview {
//    FindFriendsView(homeVM: HomeViewModel())
    VStack {
        HomeView(viewModel: HomeViewModel())
            .opacity(0.8)
            .sheet(isPresented: .constant(true), content: {
                FindFriendsView(homeVM: HomeViewModel())
            })
    }
}
