//
//  LocationDetailScreen.swift
//  junxApp
//
//  Created by apple on 05/11/2023.
//

import SwiftUI
import MapKit

struct LocationDetailScreen: View {
    @State var geometry: GeometryProxy
    @State private var region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194), // Replace with your desired coordinates
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05) // Adjust the span as needed
        )

    var body: some View {
        ZStack{
            WhiteBackground()
            
            VStack(spacing: 10) {
                HStack {
                    Text("Provide Details")
                        .font(.customFont(name: .manuale, type: .semiBold, size: 24))
                        .foregroundStyle(Color("text-main-2"))
                    
                    //                        Spacer()
                }
                
                HStack {
                    Text("Select Location")
                        .font(.customFont(name: .manuale, type: .semiBold, size: 24))
                        .foregroundStyle(Color("text-main-2"))
                    
                    Spacer()
                }.padding(.leading,30)
                    .padding(.top,10)
                
                HStack{
                    BorderView(title: .constant(""))
                    Spacer()
                }.padding(.vertical,10)
                
                RoundedRectangle(cornerRadius: 30)
                    .frame(width: geometry.size.width - 40,height: geometry.size.height * 0.35)
                    .foregroundStyle(Color("white"))
                    .shadow(radius: 4)
                    .overlay(
                        Map(coordinateRegion: $region)
                        .frame(width: geometry.size.width - 45,height: geometry.size.height * 0.34)
                        .clipShape(RoundedRectangle(cornerRadius: 35))
                    )
                    
                HStack {
                    Text("Hangout Time")
                        .font(.customFont(name: .manuale, type: .semiBold, size: 24))
                        .foregroundStyle(Color("text-main-2"))
                    
                    Spacer()
                    
                    Image("More Icon")
                        .resizable()
                        .frame(width: 24,height: 24)

                    
                    
                }.padding(.horizontal,30)
                    .padding(.top,10)
                Spacer()
                
            }
        }.frame(width: geometry.size.width)
    }
    
    func BorderView(title: Binding<String>) -> some View {
        ZStack {
        
            RoundedRectangle(cornerRadius: 15)
                .stroke(style: .init())
                .foregroundStyle(.tfBorder)
            
            HStack {
                Image("search")
                    .resizable()
                    .frame(width: 20,height: 20)
                
                
                Spacer()
                ZStack(alignment: .leading) {
                    if title.wrappedValue.isEmpty {
                        Text("Search")
                            .font(.customFont(name: .skModernist, type: .regular, size: 14))
                            .foregroundStyle(Color("text secondary-2"))
                    }
                    TextField("",text: title)
                        .font(.customFont(name: .skModernist, type: .regular, size: 14))
                        .foregroundStyle(Color("text secondary-2"))
                }
               
               
            }
            .padding(.horizontal, 20)
        }
        .frame(height: 60)
        .padding(.horizontal, 40)
    }
}

#Preview {
    GeometryReader { gr in
        LocationDetailScreen(geometry: gr)
    }
    
}
