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
    @State var results = [GitHubPictures]()
    
    let data = (1...30).map { "Item \($0)" }

       let columns = [
           GridItem(.adaptive(minimum: 100))
       ]
        
    var body: some View {
        if let user = homeViewModel.user {
            VStack {
                VStack {
                HStack {
                if let imageURL = user.avatar_url {
                    AsyncImage(url: URL(string: imageURL), content: { image in
                        image.resizable()
                    }, placeholder: {
                        ProgressView()
                    }).frame(width: 128, height: 128).clipShape(RoundedRectangle(cornerRadius:20))
                }
                    VStack (alignment: .center, spacing: 20){
                        VStack {
                            Text("Name:")
                                .foregroundColor(Color.white)
                                .fontWeight(.heavy)
                            Text(user.name ?? "ERROR")
                                .foregroundColor(Color.white)
                        }
                        VStack {
                            Text("Company:")
                                .foregroundColor(Color.white)
                                .fontWeight(.heavy)
                            Text(user.company ?? "ERROR")
                                .foregroundColor(Color.white)
                        }
                    }.padding(.top, 64)
                }
                    Text(user.bio ?? "ERROR")
                    .foregroundColor(Color.white)
                    .padding()
                    
                }.background(Color.accentColor).padding(.top, -8)
                
                ScrollView {
                           LazyVGrid(columns: columns, spacing: 10) {
                               ForEach(results, id: \.size) { item in
                                   AsyncImage(url: URL(string: item.download_url ?? "Image not found"), content: { image in
                                                        image.resizable()
                                                    }, placeholder: {
                                                        ProgressView()
                                                    }).frame(width: 128, height: 128).clipShape(RoundedRectangle(cornerRadius:20))
                               }
                           }
                           .padding(.horizontal)
                           .onAppear(perform: loadData)
                       }
                .frame(maxHeight: .infinity)
                
                Spacer()
            }      } else {
            ProgressView()
        }
    }
    
    func loadData() {
                guard let url = URL(string: "https://api.github.com/repos/ioslekcijas/faili/contents/") else {
                    print("Your API end point is Invalid")
                    return
                }
                let request = URLRequest(url: url)

                URLSession.shared.dataTask(with: request) { data, response, error in
                    if let data = data {
                        if let response = try? JSONDecoder().decode([GitHubPictures].self, from: data) {
                            DispatchQueue.main.async {
                                self.results = response
                            }
                            return
                        }
                    }
                }.resume()
            }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
