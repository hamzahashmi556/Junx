//
//  ExploreView.swift
//  junxApp
//
//  Created by Hamza Hashmi on 05/11/2023.
//

import SwiftUI

struct ExploreView: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var homeVM: HomeViewModel
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            // Title
            HStack {
                Text("Find Friends")
                    .font(.customFont(name: .manuale, type: .semiBold, size: 24))
                    .foregroundStyle(.textMain)
            }
            .padding(.top, 12)
            
            UserCardsView(width: Constants.size.width - 32)
            
            HStack(spacing: 40, content: {
                
                Image(.heartGreenCircle)
                    .shadow(color: .init(hexString: "B9DAFB"), radius: 10)
                
                Image(.closeGreenCircle)
                    .onTapGesture {
                        dismiss.callAsFunction()
                    }
            })
            .padding(.top, 30)
            
            Text("Find friends nearby")
                .font(.customFont(name: .inter, type: .regular, size: 14))
                .foregroundStyle(.textSecondary)
                .padding(.top, 17)
            
            Spacer()
        }
    }
    
    func UserCardsView(width: CGFloat) -> some View {
        
        VStack(alignment: .center) {
            
            ZStack {
                ForEach(0 ..< homeVM.users.count, id: \.self) { id in
                    
                    let width = width - CGFloat(id * 16)
                    let height = 465 - CGFloat((homeVM.users.count - id) * 21)
                    
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
            .frame(width: width, height: 465, alignment: .center)
            .padding(.top, 12)

        }
    }
}

#Preview {
    ExploreView(homeVM: HomeViewModel())
}
