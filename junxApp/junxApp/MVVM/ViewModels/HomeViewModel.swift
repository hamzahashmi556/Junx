//
//  HomeViewModel.swift
//  junxApp
//
//  Created by Hamza Hashmi on 04/11/2023.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var users: [AppUser] = [
        .init(name: "Arthur Morgan", description: "Lorem Ipsum Dolor Ismit", image: .sample5),
        .init(name: "Ezio Auditore Da Firenze", description: "Requescat in Pace", image: .sample4),
        .init(name: "Master Chief", description: "Halo The Master Chief Collection", image: .sample3),
        .init(name: "John Marston", description: "Lorem Ipsum Dolor Ismit", image: .sample2),
        .init(name: "Lara Croft", description: "Lorem Ipsum Dolor Ismit", image: .sample4)
    ]
}