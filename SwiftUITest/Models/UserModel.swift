//
//  UserModel.swift
//  SwiftUITest
//
//  Created by Dawid Bazan on 12/06/2019.
//  Copyright © 2019 Dawid Bazan. All rights reserved.
//

import Foundation
import SwiftUI


struct User: Decodable {
    let name: Name
    let email: String
    let picture: Picture
    
    enum CodingKeys: String, CodingKey {
        case name
        case email
        case picture
    }
}

struct Name: Decodable {
    let title, first, last: String
}


struct Picture: Decodable {
    let thumbnail, medium, large: String
}

struct UserResult: Decodable {
    let users: [User]
    
    enum CodingKeys: String, CodingKey {
        case users = "results"
    }
}


