//
//  DetailView.swift
//  SwiftUITest
//
//  Created by Dawid Bazan on 12/06/2019.
//  Copyright © 2019 Dawid Bazan. All rights reserved.
//

import SwiftUI

struct DetailView: View {

    let selectedUser: User
    let fullName: String
    
    init(user: User) {
        selectedUser = user
        fullName = "\(user.name.first) \(user.name.last)".capitalized
    }
    var body: some View {
        VStack {
            ImageView(imageURL: selectedUser.picture.large, size: 200)
            Text(fullName)
                .padding(.bottom, 20)
                .font(.headline)
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
                .color(.init(red: 70/255, green: 70/255, blue: 70/255))
                .lineLimit(nil)
                .font(.subheadline)
            Spacer()
        }.padding()
    }
}
