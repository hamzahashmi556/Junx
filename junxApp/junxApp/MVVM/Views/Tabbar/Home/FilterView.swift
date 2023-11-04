//
//  FilterView.swift
//  junxApp
//
//  Created by Hamza Hashmi on 04/11/2023.
//

import SwiftUI

struct FilterView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var homeVM: HomeViewModel
    
    @State var age = 0.0
    
    @State var distance = 0.0
    
    @State var selectedGender = 0
    
    @State var showOnline = false
    
    var body: some View {
        ScrollView {
            
            VStack(spacing: 0) {
                
                Text("Add Filters By")
                    .foregroundStyle(.textMain)
                    .font(.customFont(name: .manuale, type: .semiBold, size: 24))
                    .padding(.top, 45)
                    .padding(.bottom, 18)
                
                BorderView(title: "Age", imageName: "chevron.down")
                
                VStack {
                    HStack {
                        Text("Age")
                        
                        Spacer()
                        
                        Text("18-\(Int(age))")
                    }
                    .font(.customFont(name: .inter, type: .semiBold, size: 16))
                    
                    Slider(value: $age, in: 18...25)
                }
                .padding(.horizontal, 60)
                .padding(.top, 26)
                .padding(.bottom, 13)
                
                BorderView(title: "Distance", imageName: "chevron.down")
                
                VStack {
                    HStack {
                        Text("Distance")
                        
                        Spacer()
                        
                        Text("100-\(Int(distance))")
                    }
                    .font(.customFont(name: .inter, type: .semiBold, size: 16))
                    
                    Slider(value: $distance, in: 100...250)
                }
                .padding(.horizontal, 60)
                .padding(.top, 26)
                .padding(.bottom, 13)
                
                BorderView(title: "Sex", imageName: "chevron.down")
                
                Picker(selection: $selectedGender) {
                    Text("Male").tag(0)
                    
                    Text("Female").tag(1)
                    
                    Text("Both").tag(2)
                    
                } label: {
                    EmptyView()
                }
                .pickerStyle(.segmented)
                .padding(.horizontal, 40)
                .padding(.top, 18)
                .padding(.bottom, 44)
                
                VStack(spacing: 20, content: {
                    BorderView(title: "Online Now", imageName: "", toggle: true)
                    
                    BorderView(title: "Add Location", imageName: "plus")

                    CustomButton(title: "Apply Filter", width: Constants.size.width - 80, action: {
                        self.homeVM.isFilterApplied.toggle()
                    })
                })
            }
        }
        .tint(.greenTheme)
    }
    
    func BorderView(title: String, imageName: String, toggle: Bool = false) -> some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 15)
                .stroke(style: .init())
                .foregroundStyle(.tfBorder)
            
            HStack {
                
                Text(title)
                
                Spacer()
                
                if toggle {
                    Toggle(isOn: $showOnline, label: {
                        EmptyView()
                    })
                }
                else {
                    Image(systemName: imageName)
                }
            }
            .padding(.horizontal, 20)
        }
        .frame(height: 60)
        .padding(.horizontal, 40)
    }
}

#Preview {
    FilterView(homeVM: HomeViewModel())
}
