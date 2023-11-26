//
//  StoryView.swift
//  junxApp
//
//  Created by Hamza Hashmi on 29/10/2023.
//

import SwiftUI

struct StoryListView: View {
    
    @State var stories: [Int] = [1,2,3,4]
    @State var images: [ImageResource] = [.ellipse101, .ellipse102, .ellipse103, .ellipse104]
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 0) {
                ZStack{
                    Circle()
                        .stroke(Color.greenTheme, lineWidth: 5)
                    
                    Image(.ellipse10)
                        .resizable()
                        .clipShape(Circle())
                    
                    VStack {
                        HStack {
                            Spacer()
                            Image("Group 48")
                                .offset(y:20)
                        }
                    }

                    
                }.frame(width: 60,height: 60)
                
                ForEach(0 ..< stories.count, id: \.self) { id in
                    StoryView(numberOfStories: self.stories[id], imageResource: self.images[id])
                }
            }
            .padding(.leading, 28)
            .padding(.vertical, 5)
            
        }
    }
}

struct StoryView: View {
    
    var numberOfStories: Int
    var gapWidth: Double = 0.05
    
    @State var imageResource: ImageResource
    
    var body: some View {
        
        ZStack {
            
            ForEach(0..<numberOfStories, id: \.self) { index in
                Circle()
                    .trim(
                        from: CGFloat(Double(index) / Double(numberOfStories) + gapWidth/2),
                        to: CGFloat(Double(index + 1) / Double(numberOfStories) - gapWidth/2))
                    .stroke(Color.greenTheme, lineWidth: 5)
            }
            
            Image(imageResource)
                .resizable()
                .clipShape(Circle())
            
//            Circle()
//                .trim(from: 0, to: 0.15)
//                .stroke(Color.green, lineWidth: 5)
//                .frame(width: 100, height: 100)
//            
//            Circle()
//                .trim(from: 0.2, to: 0.35)
//                .stroke(Color.green, lineWidth: 5)
//                .frame(width: 100, height: 100)
//            
//            Circle()
//                .trim(from: 0.4, to: 0.55)
//                .stroke(Color.green, lineWidth: 5)
//                .frame(width: 100, height: 100)
//            
//            Circle()
//                .trim(from: 0.6, to: 0.75)
//                .stroke(Color.green, lineWidth: 5)
//                .frame(width: 100, height: 100)
//            
//            Circle()
//                .trim(from: 0.8, to: 0.95)
//                .stroke(Color.green, lineWidth: 5)
//                .frame(width: 100, height: 100)
        }
        .frame(width: 60, height: 60)
        .padding(.leading, 12)
    }
}

#Preview {
    
    HStack {
        StoryListView()
//        StoryView(numberOfStories: 5)
    }
}
