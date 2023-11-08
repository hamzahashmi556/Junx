//
//  AppUser.swift
//  junxApp
//
//  Created by Hamza Hashmi on 01/11/2023.
//

import Foundation
import SwiftUI

struct AppUser {
    var id: Int
    var name: String
    var username: String
    var description: String
    var image: ImageResource
    var friends = 260
    var followers = "65K"
    
    init(id: Int, name: String, description: String, image: ImageResource, friends: Int = 260, followers: String = "65K") {
        self.name = name
        self.username = "@\(name.replacingOccurrences(of: " ", with: "_"))"
        self.description = description
        self.image = image
        self.friends = friends
        self.followers = followers
        self.id = id
    }
}
