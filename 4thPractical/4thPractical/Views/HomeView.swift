//
//  ContentView.swift
//  4thPractical
//
//  Created by user215333 on 4/6/22.
//

import SwiftUI

struct CustomColor {
    static let myColor = Color("BackgroundColor")
}

struct HomeView: View {
    
    @ObservedObject var homeViewModel = HomeViewModel()
        
    var body: some View {
        if let user = homeViewModel.user {
            HStack (spacing: 0){
                Spacer()
                Text("Minestagram").font(.system(size: 60)).foregroundColor(Color.white).fontWeight(.heavy);                Spacer()
            }.background(CustomColor.myColor)
                Spacer()
      
            VStack (spacing: 0) {
                VStack (spacing: 0) {
                HStack {
                if let imageURL = user.avatar_url {
                    AsyncImage(url: URL(string: imageURL), content: { image in
                        image.resizable()
                    }, placeholder: {
                        ProgressView()
                    }).frame(width: 128, height: 128).clipShape(RoundedRectangle(cornerRadius:20))
                }
                    VStack (alignment: .center, spacing: 20){
                        VStack (spacing: 0){
                            Text("Name:").foregroundColor(Color.white).fontWeight(.heavy)
                            Text(user.name ?? "ERROR").foregroundColor(Color.white)
                        }
                        VStack (spacing: 0){
                            Text("Company:").foregroundColor(Color.white).fontWeight(.heavy)
                            Text(user.company ?? "ERROR").foregroundColor(Color.white)
                        }
                    }.padding(.top, 64)
                }
                    Text(user.bio ?? "ERROR").foregroundColor(Color.white).padding()                }.background(Color.accentColor).padding(.top, -8)
                Spacer()
            }
        
        } else {
            ProgressView()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
