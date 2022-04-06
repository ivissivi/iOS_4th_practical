//
//  ContentView.swift
//  4thPractical
//
//  Created by user215333 on 4/6/22.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var homeViewModel = HomeViewModel()
        
    var body: some View {
        if let user = homeViewModel.user {
            VStack (alignment: .center, spacing: 22) {
                Text(user.name ?? "ERROR")
                
                if let imageURL = user.avatar_url {
                    AsyncImage(url: URL(string: imageURL), content: { image in
                        image.resizable()
                    }, placeholder: {
                        ProgressView()
                    }).frame(width: 128, height: 128)
                }
                
                Text(user.bio ?? "ERROR")
                Text(user.company ?? "ERROR")
            }
        } else {
            ProgressView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
