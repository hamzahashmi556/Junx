//
//  ChatView.swift
//  junxApp
//
//  Created by Hamza Hashmi on 29/10/2023.
//

import SwiftUI

struct ChatView: View {
    
    @State var searchText = ""
    @State var isSearching = false
    
    var body: some View {
        ScrollView {
            
            SearchBar(text: $searchText, isSearching: $isSearching)
                .frame(height: 48)
                .padding(.horizontal, 40)
                .padding(.top, 13)
            
            ActivitiesView()
            
            MessageList()
        }
        .toolbar(content: {
            ToolbarItem(placement: .principal) {
                Text("Messages")
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Image(systemName: "slider.horizontal.3")
            }
            
        })
        .toolbarTitleDisplayMode(.inline)
    }
    
    
    // MARK: - Activities
    
    func ActivitiesView() -> some View {
        VStack(alignment: .leading, spacing: 10, content: {
            
            // Headcer
            Text("Activities")
                .font(.customFont(name: .manuale, type: .semiBold, size: 18))
                .padding(.leading, 40)
                .padding(.top, 10)
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach(0 ..< 10, id: \.self) { index in
                        VStack {
                            CircularImageView(width: 66)
                            
                            Text("")
                        }
                    }
                }
                .padding(.leading, 40)
            }
        })
    }
    
    // MARK: Activities -
    
    
    // MARK: - Messages
    
    func MessageList() -> some View {
        
        VStack(alignment: .leading, spacing: 16) {
            
            Text("Messages")
                .font(.customFont(name: .manuale, type: .semiBold, size: 18))
                .padding(.leading, 40)
            
            ForEach(1 ..< 9, id: \.self) { id in
                MessageRow(text: "Text Message \(id)", unread: id)
            }
        }
    }
    
    func MessageRow(text: String, unread: Int) -> some View {
        HStack {
            CircularImageView(width: 56)
            
            VStack(alignment: .leading) {
                Text("Full Name")
                    .font(.customFont(name: .inter, type: .semiBold, size: 14))
                    .frame(height: 21, alignment: .bottom)
                
                Text("Last Message :)")
                    .font(.customFont(name: .inter, type: .regular, size: 14))
                    .frame(height: 21, alignment: .top)
            }
            
            Spacer()
            
            VStack(alignment: .trailing) {
                Text("23 min")
                    .font(.customFont(name: .inter, type: .medium, size: 12))
                
                UnreadNumberView(number: unread)

            }
        }
        .frame(height: 56)
        .padding(.horizontal, 40)
    }
    
    func UnreadNumberView(number: Int) -> some View {
        Circle()
            .frame(width: 18, height: 18)
            .foregroundStyle(.greenTheme)
            .overlay {
                Text("\(number)")
                    .font(.customFont(name: .skModernist, type: .bold, size: 12))
                    .foregroundStyle(.white)
            }
    }
    
    // MARK: Message -
}

struct SearchBar: View {
    
    @Binding var text: String
    @Binding var isSearching: Bool

    var body: some View {
        
        HStack {
            
            Image("search")
                .padding()
            
            TextField("Search", text: $text)
            
            Button(action: {
                text = ""
                isSearching = false
            }) {
                Image(systemName: "xmark.circle.fill")
                    .foregroundColor(.gray)
            }
            .padding(8)
            .opacity(text.isEmpty ? 0 : 1)
        }
        .background {
            RoundedRectangle(cornerRadius: 15)
                .stroke()
                .foregroundStyle(.tfBorder)
        }
        .padding(10)
        
    }
}

struct CircularImageView: View {
    
    @State var showBorder: Bool = true
    
    @State var width: CGFloat
    
    var body: some View {
        VStack {
            ZStack {
                if showBorder {
                    Circle()
                        .stroke()
                        .foregroundStyle(.greenTheme)
                }
                
                Image(.sample1)
                    .resizable()
                    .clipShape(Circle())
                    .aspectRatio(contentMode: .fill)
                    .padding(4)
            }
        }
        .frame(width: width, height: width)
    }
}

#Preview {
    NavigationView {
        ChatView()
    }
}
