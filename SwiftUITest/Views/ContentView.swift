//
//  ContentView.swift
//  SwiftUITest
//
//  Created by Dawid Bazan on 05/06/2019.
//  Copyright © 2019 Dawid Bazan. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    
    @State var networkManager = NetworkManager()

    var body: some View {
        
        NavigationView {
            List {
                
                //top cells
                ScrollView {
                    HStack(spacing: 15) {
                        ForEach(networkManager.users.identified(by: \.email)) { user in
                            PostRow(user: user)
                        }
                    }
                }.frame(height: 100).padding(.trailing, -20)
                
                //rows
                ForEach(networkManager.users.identified(by: \.email)) { user in
                    PostRow(user: user)
                }
            
            }.navigationBarTitle(Text("Friendbook"))
            .navigationBarItems(trailing:
                Button(action: {
                    print("hello")
                }, label: {
                    Text("More")
                }).accentColor(.black)
            )
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
