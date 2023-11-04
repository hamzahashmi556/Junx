//
//  HomeViewModel.swift
//  junxApp
//
//  Created by Hamza Hashmi on 04/11/2023.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var users: [AppUser] = [
        .init(name: "Arthur Morgan", description: "Lorem Ipsum Dolor Ismit", image: .sample1),
        .init(name: "Ezio Auditore Da Firenze", description: "Requescat in Pace", image: .sample2),
        .init(name: "Master Chief", description: "Halo The Master Chief Collection", image: .sample3),
        .init(name: "John Marston", description: "Lorem Ipsum Dolor Ismit", image: .sample5),
        .init(name: "Lara Croft", description: "Lorem Ipsum Dolor Ismit", image: .sample4)
    ]
    
    @Published var isPresentAddFilter = false
    @Published var isFilterApplied = false
    @Published var isPresentFilterView = false
    @Published var isPresentExplore = false
    
    @Published var filterType: FilterType = .distance
}

enum FilterType {
    case location
    case distance
    case gender
}
