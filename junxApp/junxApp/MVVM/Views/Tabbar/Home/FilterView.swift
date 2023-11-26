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
    @State var sliderPositionAge: ClosedRange<Int> = 3...28
    @State var sliderPositionDistance: ClosedRange<Int> = 50...250
    @State var distance = 0.0
    
    @State var selectedGender = 0
    
    @State var showOnline = false
    
    var body: some View {
        ZStack{
            WhiteBackground()
            ScrollView {
                
                VStack(spacing: 0) {
                    
                    Text("Add Filters By")
                        .foregroundStyle(.textMain)
                        .font(.customFont(name: .manuale, type: .semiBold, size: 24))
                        .padding(.top, 35)
                        .padding(.bottom, 18)
                    
                    BorderView(title: "Age", imageName: "chevron.down")
                    
                    VStack {
                        HStack {
                            Text("Age")
                            
                            Spacer()
                            
                            Text("\(Int(sliderPositionAge.lowerBound))-\(Int(sliderPositionAge.upperBound))")
                        }
                        .font(.customFont(name: .inter, type: .semiBold, size: 16))
                        .padding(.bottom,10)
                        RangedSliderView(value: $sliderPositionAge, bounds: 3...28)
                        
                    }
                    .padding(.horizontal, 60)
                    .padding(.top, 26)
                    .padding(.bottom, 13)
                    
                    BorderView(title: "Distance", imageName: "chevron.down")
                    
                    VStack {
                        HStack {
                            Text("Kilometers")
                            
                            Spacer()
                            
                            Text("\(Int(sliderPositionDistance.lowerBound))-\(Int(sliderPositionDistance.upperBound))")
                        }
                        .font(.customFont(name: .inter, type: .semiBold, size: 16))
                        .padding(.bottom,10)
                        
                        RangedSliderView(value: $sliderPositionDistance, bounds: 50...250)
                    }
                    .padding(.horizontal, 60)
                    .padding(.top, 26)
                    .padding(.bottom, 13)
                    
                    BorderView(title: "Sex", imageName: "chevron.down")
                        .padding(.top,10)
                    
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
            
            tintBackground()
            VStack{
                Spacer()
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 333, height: 227, alignment: .center)
                    .foregroundStyle(.popupBg)
                    .overlay(
                        VStack{
                            Text("Save Changes")
                                .foregroundStyle(.textMain)
                                .font(.customFont(name: .manuale, type: .semiBold, size: 24))
                                .padding(.top,25)
                            
                            Text("If you leave this page, Your Changes will not be saved. ")
                                .font(.customFont(name: .inter, type: .regular, size: 14))
                                .foregroundStyle(Color("70-black"))
                                .padding(.top,5)
                               
                            
                            HStack{
                                RoundedRectangle(cornerRadius: 30)
                                    .frame(width: 92, height: 34.25, alignment: .center)
                                    .foregroundStyle(.greenTheme)
                                    .shadow(color: .onlyblack.opacity(0.2), radius: 1, x: 0, y: 4)
                                    .overlay(
                                        HStack{
                                            Text("Save")
                                                .font(.customFont(name: .inter, type: .regular, size: 14))
                                                .foregroundStyle(.whiteonly)
                                            
                                            
                                        }
                                    )
                                
                                ZStack{
                                    RoundedRectangle(cornerRadius: 30)
                                        .stroke(Color("0B8793"),lineWidth: 1)
                                        .frame(width: 92, height: 34.25, alignment: .center)
                                       .overlay(
                                            HStack{
                                                Text("Discard")
                                                    .font(.customFont(name: .inter, type: .regular, size: 14))
                                                    .foregroundStyle(Color("0B8793"))
                                                
                                                
                                            }
                                        )
                                } .frame(width: 92, height: 34.25, alignment: .center)
                            }
                            .padding(.top)
                            
                            Spacer()
                        }
                    )
                Spacer()
            }.padding(.bottom,120)
          
        }
       
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

struct RangedSliderView: View {
    let currentValue: Binding<ClosedRange<Int>>
    let sliderBounds: ClosedRange<Int>
    
    public init(value: Binding<ClosedRange<Int>>, bounds: ClosedRange<Int>) {
        self.currentValue = value
        self.sliderBounds = bounds
    }
    
    var body: some View {
        GeometryReader { geometry in
            sliderView(sliderSize: geometry.size)
        }
    }
    
    @ViewBuilder private func sliderView(sliderSize: CGSize) -> some View {
        let sliderViewYCenter = sliderSize.height / 2
        ZStack {
            RoundedRectangle(cornerRadius: 2)
                .fill(Color("sliderbg"))
                .frame(height: 3)
            ZStack {
                let sliderBoundDifference = sliderBounds.upperBound - sliderBounds.lowerBound
                let stepWidthInPixel = CGFloat(sliderSize.width) / CGFloat(sliderBoundDifference)
                
                // Calculate Left Thumb initial position
                let leftThumbLocation: CGFloat = CGFloat(currentValue.wrappedValue.lowerBound - sliderBounds.lowerBound) * stepWidthInPixel
                
                // Calculate right thumb initial position
                let rightThumbLocation = CGFloat(currentValue.wrappedValue.upperBound - sliderBounds.lowerBound) * stepWidthInPixel
                
                // Path between both handles
                lineBetweenThumbs(from: .init(x: leftThumbLocation, y: sliderViewYCenter), to: .init(x: rightThumbLocation, y: sliderViewYCenter))
                
                // Left Thumb Handle
                let leftThumbPoint = CGPoint(x: leftThumbLocation, y: sliderViewYCenter)
                thumbView(position: leftThumbPoint, value: currentValue.wrappedValue.lowerBound)
                    .highPriorityGesture(DragGesture().onChanged { dragValue in
                        let dragLocation = dragValue.location
                        let xThumbOffset = min(max(0, dragLocation.x), sliderSize.width)
                        
                        let newValue = Int(xThumbOffset / stepWidthInPixel) + sliderBounds.lowerBound
                        
                        // Stop the range thumbs from colliding each other
                        if newValue < currentValue.wrappedValue.upperBound {
                            currentValue.wrappedValue = newValue...currentValue.wrappedValue.upperBound
                        }
                    })
                
                // Right Thumb Handle
                thumbView(position: CGPoint(x: rightThumbLocation, y: sliderViewYCenter), value: currentValue.wrappedValue.upperBound)
                    .highPriorityGesture(DragGesture().onChanged { dragValue in
                        let dragLocation = dragValue.location
                        let xThumbOffset = min(max(leftThumbLocation, dragLocation.x), sliderSize.width)
                        
                        var newValue = Int(xThumbOffset / stepWidthInPixel) + sliderBounds.lowerBound
                        
                        // Stop the range thumbs from colliding each other
                        if newValue > currentValue.wrappedValue.lowerBound {
                            currentValue.wrappedValue = currentValue.wrappedValue.lowerBound...newValue
                        }
                    })
            }
        }
    }
    
    @ViewBuilder func lineBetweenThumbs(from: CGPoint, to: CGPoint) -> some View {
        Path { path in
            path.move(to: from)
            path.addLine(to: to)
        }.stroke(.sliderline, lineWidth: 2)
    }
    
    @ViewBuilder func thumbView(position: CGPoint, value: Int) -> some View {
        ZStack {
            Circle()
                .frame(width: 20, height: 20)
                .foregroundColor(.buttonLinear2)
                .contentShape(Rectangle())
        }
        .position(x: position.x, y: position.y)
    }
}


#Preview {
    FilterView(homeVM: HomeViewModel())
}
