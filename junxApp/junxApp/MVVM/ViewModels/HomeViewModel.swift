//
//  HomeViewModel.swift
//  junxApp
//
//  Created by Hamza Hashmi on 04/11/2023.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var users: [AppUser] = [
        .init(id: 0, name: "Arthur Morgan", description: "Lorem Ipsum Dolor Ismit", image: .sample1),
        .init(id: 1, name: "Ezio Auditore Da Firenze", description: "Requescat in Pace", image: .sample2),
        .init(id: 2, name: "Master Chief", description: "Halo The Master Chief Collection", image: .sample3),
        .init(id: 3, name: "John Marston", description: "Lorem Ipsum Dolor Ismit", image: .sample5),
        .init(id: 4, name: "Lara Croft", description: "Lorem Ipsum Dolor Ismit", image: .sample5)
    ]
    
    @Published var isPresentAddFilter = true
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
