//
//  ContentView.swift
//  4thPractical
//
//  Created by user215333 on 5/21/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack (alignment: .center){
            Spacer()
            Text("Minestagram")
                .font(.system(size:40))
                .foregroundColor(Color.white)
                .fontWeight(.heavy)
                .frame(maxWidth: .infinity, alignment: .leading);
        }.background(CustomColor.myColor)
        Spacer()
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            ImagesView()
                .tabItem {
                    Image(systemName: "photo")
                    Text("Images")
                }
            VideosView()
                .tabItem {
                    Image(systemName: "video")
                    Text("Videos")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
