//
//  File.swift
//  SwiftUITest
//
//  Created by Dawid Bazan on 13/06/2019.
//  Copyright © 2019 Dawid Bazan. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class NetworkManager: BindableObject {
    var didChange = PassthroughSubject<NetworkManager, Never>()
    
    var users: [User] = [] {
        didSet {
            didChange.send(self)
        }
    }
    
    init() {
        guard let url = URL(string: "https://randomuser.me/api/?results=10") else { return }
        let request : URLRequest = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            guard let data = data else { return }
            
            do {
                let result = try JSONDecoder().decode(UserResult.self, from: data)
                DispatchQueue.main.async {
                    self.users = result.users
                }
            } catch {
                print(error)
            }
        }.resume()
    }
}

class ImageLoader: BindableObject {
    var didChange = PassthroughSubject<Data, Never>()
    
    var data = Data() {
        didSet {
            didChange.send(data)
        }
    }
    
    init(imageURL: String) {
        guard let url = URL(string: imageURL) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            DispatchQueue.main.async {
                self.data = data
            }
            
        }.resume()
    }
}
