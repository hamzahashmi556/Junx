//
//  ChatView.swift
//  junxApp
//
//  Created by Hamza Hashmi on 06/11/2023.
//

import SwiftUI

struct DMView: View {
    
    @Environment(\.dismiss) var dismiss

    @State private var newMessage = ""
    
    @State private var showMessages = false
  
    var body: some View {
        
        ZStack {
            
            ScrollView(showsIndicators: false) {
                
                VStack {
                    
                    // Reciever
                    HStack {
                        imageView()
                        Spacer()
                    }
                    
                    // Sender
                    HStack {
                        Spacer()
                        Sender(text: "I am on my way.")
                    }
                    
                    HStack {
                        Reciever(text: "OK Am Waiting")
                        Spacer()
                    }
                }
                .padding(.top)
            }
            .padding(.horizontal, 25)
            
            VStack {
                Spacer()
                
                HStack {
                    Image(systemName: "plus")
                        .padding(.horizontal, 5)
                    
                    TextField("Enter Message", text: $newMessage)
                        .frame(height: 36)
                        .padding(.leading)
                        .background(.tfBorder)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                    
                    Image(systemName: "paperplane.fill")
                        .padding(.horizontal, 5)
                }
                .padding([.bottom, .horizontal])
            }
            
            if showMessages {
                DMOptionsView()
            }
            
        }
        .toolbar {
            
            ToolbarItem(placement: .cancellationAction) {
                Image(systemName: "chevron.left")
                    .onTapGesture {
                        dismiss.callAsFunction()
                    }
            }
            
            ToolbarItem(placement: .cancellationAction) {
                Text("Full Name")
                    .foregroundStyle(.textMain)
                    .font(.customFont(name: .mulish, type: .semiBold, size: 18))
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                HStack {
                    
                    Image(systemName: "magnifyingglass")

                    Image(systemName: "line.horizontal.3")
                        .onTapGesture {
                            withAnimation {
                                self.showMessages.toggle()
                            }
                        }
                }
            }
        }
    }
    
    func Sender(text: String) -> some View {
        VStack(alignment: .trailing, spacing: 5) {
            Text(text)
                .font(.customFont(name: .mulish, type: .regular, size: 14))

            
            Text("16:33 - Read")
                .font(.customFont(name: .mulish, type: .regular, size: 12))

        }
        .foregroundStyle(.white)
        .padding()
        .background {
            UnevenRoundedRectangle(cornerRadii: RectangleCornerRadii(topLeading: 15, bottomLeading: 15, topTrailing: 15))
                .foregroundStyle(.greenTheme)
        }
    }
    
    func Reciever(text: String) -> some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(text)
                .font(.customFont(name: .mulish, type: .regular, size: 14))
            
            
            Text("16:33 - Read")
                .font(.customFont(name: .mulish, type: .regular, size: 12))
                .foregroundStyle(.textSecondary2)

        }
    }
    
    func imageView() -> some View {
        VStack(alignment: .leading) {
            Image(.sample4)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 266, height: 150)
                .scaledToFill()
                .clipShape(RoundedRectangle(cornerRadius: 15))
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Look at how chocho sleep in my arms!")
                    .font(.customFont(name: .mulish, type: .regular, size: 14))

                
                Text("16:33")
                    .font(.customFont(name: .mulish, type: .regular, size: 12))
                    .foregroundStyle(.textSecondary2)

            }
            .padding(.top, 5)
        }
        .frame(width: 266)
    }
}

#Preview {
    NavigationView {
        DMView()
    }
}
