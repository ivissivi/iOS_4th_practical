//
//  ImagesView.swift
//  4thPractical
//
//  Created by user215333 on 5/21/22.
//

import SwiftUI

struct ImagesView: View {
    
    @ObservedObject var homeViewModel = HomeViewModel()
    @State var results = [GitHubPictures]()
    
    var body: some View {
        if let picture = homeViewModel.pictures {
            HStack {
             
            }
                VStack (alignment: .leading, spacing: 9) {
                    Text("Title")
                        .fontWeight(.semibold)
                        .lineLimit(2)
                        .minimumScaleFactor(0.5)
                
                    Text("Upload date")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
        
            } else {
                List(results, id: \.size) { item in
                            VStack(alignment: .leading) {
                                Text(item.name ?? "ERROR")
                                AsyncImage(url: URL(string: item.download_url ?? "Image not found"), content: { image in
                                    image.resizable()
                                }, placeholder: {
                                    Text("Image not found")
                                }).frame(width: 256, height: 256).clipShape(RoundedRectangle(cornerRadius:10))
                            }
                        }.onAppear(perform: loadData)
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

struct ImagesView_Previews: PreviewProvider {
    static var previews: some View {
        ImagesView()
    }
}
