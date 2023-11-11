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
    
    var body: some View {
        
        ZStack {
            
            WhiteBackground()
            
            VStack(spacing: 0) {
                
                // Title
                HStack(alignment: .bottom) {
                    Text("Find Friends")
                        .font(.customFont(name: .manuale, type: .semiBold, size: 24))
                        .foregroundStyle(.textMain)
                }
                .padding(.top, 12)
                .frame(height: 35)
                
                UserCardsView(width: Constants.size.width - 32)
                
                ZStack(alignment: .center) {
                    
                    Image(.heartGreenCircle)
                        .offset(x: -65)
                    
                    Button(action: {
                        dismiss.callAsFunction()
                    }, label: {
                        Image(.closeGreenCircle)
                    })
                    .offset(x: 65, y: 7)
                }
                .frame(height: 115, alignment: .center)
                .padding(.bottom)
                
                Text("Find friends nearby")
                    .font(.customFont(name: .inter, type: .regular, size: 14))
                    .foregroundStyle(.textSecondary)
                    .padding(.top, 17)
            }
        }
        .presentationDetents([.height(Constants.size.height * 0.84)])
        .presentationCornerRadius(30)
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
                                .onAppear(perform: {
                                    debugPrint("\n Width:")
                                    debugPrint(width - CGFloat(id * 10))
                                    debugPrint("Width: \n")
                                })
                            
                            if id == homeVM.users.count - 1 {
                                
                                VStack {
                                    
                                    Spacer()
                                    
                                    UnevenRoundedRectangle(cornerRadii: RectangleCornerRadii(
                                        topLeading: 0,
                                        bottomLeading: 25,
                                        bottomTrailing: 25,
                                        topTrailing: 0)
                                    )
                                    .foregroundStyle(.greenTheme)
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
