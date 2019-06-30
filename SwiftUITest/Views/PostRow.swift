//
//  FriendRow.swift
//  SwiftUITest
//
//  Created by Dawid Bazan on 05/06/2019.
//  Copyright © 2019 Dawid Bazan. All rights reserved.
//

import SwiftUI

struct PostRow: View {
    var user: User
    var fullName: String
    
    init(user: User) {
        self.user = user
        self.fullName = "\(user.name.first) \(user.name.last)"
    }
    
    var body: some View {
        
        NavigationButton(destination: DetailView(user: user)) {
            VStack(alignment: .leading, spacing: 10) {
                HStack(spacing: 10) {
                    ImageView(imageURL: user.picture.medium, size: 70)
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text(fullName.capitalized).font(.headline)
                        Text("Posted 10min ago").font(.system(size: 12)).color(.gray)
                    }
                }
            }.padding(10).padding(.leading, -5)
        }
    }
}

struct ImageView: View {
    
    @ObjectBinding var imageLoader: ImageLoader
    var imageSize: Length
    
    init(imageURL: String, size: Length) {
        imageLoader = ImageLoader(imageURL: imageURL)
        imageSize = size
    }
    
    var body: some View {
        Image(uiImage: (imageLoader.data.count == 0) ? UIImage() : UIImage(data: imageLoader.data)!)
            .resizable()
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 2))
            .frame(width: imageSize, height: imageSize)
            .shadow(radius: 2)
    }
}



#if DEBUG
//struct FriendRow_Previews : PreviewProvider {
//    static var previews: some View {
//        FriendRow(friend: )
//    }
//}
#endif
