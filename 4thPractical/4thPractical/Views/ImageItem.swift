//
//  ImageItem.swift
//  4thPractical
//
//  Created by user215333 on 5/22/22.
//

import SwiftUI

struct ImageItem: View {
    
    @Environment(\.colorScheme) var colorScheme
    @State var results = [GitHubPictures]()
    
    var body: some View {
        let colors: Array<Color> = colorScheme == .dark ? [Color(#colorLiteral(red: 0.6196078431, green: 0.6784313725, blue: 1, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.5607843137, blue: 0.9803921569, alpha: 1))] : [Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))]

        List(results, id: \.size) { item in
        
            HStack(spacing: 8) {
                AsyncImage(url: URL(string: item.download_url ?? "Image not found"), content: { image in
                                     image.resizable()
                                 }, placeholder: {
                                     ProgressView()
                                 }).frame(width: 128, height: 128).clipShape(RoundedRectangle(cornerRadius:20))
                             
                         
                  VStack(alignment: .leading, spacing: 4) {
                      LinearGradient(gradient: Gradient(colors: colors), startPoint: .leading, endPoint: .trailing)
                          .mask(Text(item.name ?? "ERROR").fontWeight(.semibold).textCase(.uppercase).font(.footnote).frame(maxWidth: .infinity, alignment: .leading))
                          .frame(maxHeight: 30)
                  }
              }.padding(.horizontal, 12)
                .padding(.vertical, 16)
                .background(colorScheme == .dark ? Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.2) : Color(#colorLiteral(red: 0.9568627451, green: 0.9450980392, blue: 1, alpha: 1)))
                .cornerRadius(20)
        }.onAppear(perform: loadData)
            
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

struct ImageItem_Previews: PreviewProvider {
    static var previews: some View {
        ImageItem()
    }
}
