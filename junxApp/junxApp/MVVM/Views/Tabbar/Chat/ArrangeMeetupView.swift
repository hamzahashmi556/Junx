//
//  ArrangeMeetupView.swift
//  junxApp
//
//  Created by Hamza Hashmi on 07/11/2023.
//

import SwiftUI

struct ArrangeMeetupView: View {
    
    let year: Int
    let month: Int
    
    @State var weeks: [Week] = []

    var body: some View {
        VStack {
            
            HStack {
                Text("Lets Arrange a Hangout.")
                    .font(.customFont(name: .manuale, type: .semiBold, size: 24))
                Spacer()
            }
            .padding(.top, 48)
            
            Spacer()
            
            HStack {
                Text("Select Dates")
                    .font(.customFont(name: .manuale, type: .semiBold, size: 24))
                
                Spacer()
                
                Image(systemName: "ellipsis")
            }
            
            MonthView(weeks: weeks)
            
            
            HStack {
                ForEach(Calendar.current.veryShortWeekdaySymbols, id: \.self) { item in
                    Text(item)
                        .font(.customFont(name: .roboto, type: .regular, size: 14))
                        .frame(maxWidth: .infinity)
                        .textCase(.uppercase)
                        .foregroundStyle(.black)
                }
            }
            .padding(.top)
            
            HStack {
                Text("Hangout Time")
                    .font(.customFont(name: .manuale, type: .semiBold, size: 24))
                
                Spacer()
                
                Image(systemName: "ellipsis")
            }
            .padding(.top, 60)
            
            HStack {
                ForEach(1 ... 5, id: \.self) { index in
                    VStack(spacing: 10) {
                        Text("\(index)")
                            .font(.customFont(name: .roboto, type: .medium, size: 20))
                        
                        Text(index == 1 ? "Hour" : "Hours")
                            .font(.customFont(name: .roboto, type: .regular, size: 12))
                    }
                    .frame(maxWidth: .infinity)
                }
                .padding(.top, 25)
            }
            
            Spacer()
        }
        .padding(.horizontal, 35)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Image("text+image logo")
            }
        }
        .toolbarTitleDisplayMode(.inline)
        .onAppear {
            var weeks = [Week]()
            for week in 0...4 {
                var days = [Day]()
                for day in 1...7 {
                    var dayObject = Day(number: week * 7 + day)
                    dayObject.isSelected = 3...6 ~= day && week == 3
                    days.append(dayObject)
                }
                weeks.append(Week(days: days))
            }
            self.weeks = weeks
        }
    }
}

struct Day {
    let number: Int
    var isHeighlighted = false
    var isSelected = false
    var isEnabled = true
    var isCurrent = false
    var onSelect: (() -> Void) = {}
}

struct Week: Identifiable {
    let id = UUID()
    let days: [Day]
}

struct WeekView: View {
    let week: Week

    var body: some View {
        HStack {
            ForEach(week.days, id: \.number) { day in
                DayView(day: day)
                    .frame(maxWidth: .infinity)
            }
        }
    }
}

struct DayView: View {
    
    let day: Day

    var body: some View {
        
        ZStack {
            
            if day.isSelected {
                Circle()
                    .foregroundStyle(.greenTheme)
                
                Text("\(day.number)")
                    .font(.customFont(name: .roboto, type: .bold, size: 14))
                    .textCase(.uppercase)
                    .foregroundColor(.white)
//                    .frame(width: 30, height: 30)
                    .frame(maxWidth: .infinity)
            }
            else {
                Circle()
                    .foregroundStyle(.gray.opacity(0.5))
                
                Text("\(day.number)")
                    .font(.customFont(name: .roboto, type: .regular, size: 14))
                    .textCase(.uppercase)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity)
//                    .frame(width: 30, height: 30)

            }
        }
        .padding(4)
        .opacity(day.isEnabled ? 1 : 0)
        .onTapGesture(perform: day.onSelect)
    }
}

struct MonthView: View {
    let weeks: [Week]

    var body: some View {
        VStack {
            ForEach(weeks) { week in
                WeekView(week: week)
            }
//            ForEach(weeks, content: WeekView.init(week:))
        }
    }
}

#Preview {
    NavigationView {
        ArrangeMeetupView(year: 2023, month: 12)
    }
}
