//
//  ImagesView.swift
//  4thPractical
//
//  Created by user215333 on 5/21/22.
//

import SwiftUI

struct ImagesView: View {
    
    @ObservedObject var homeViewModel = HomeViewModel()
    
    var body: some View {
        if let picture = homeViewModel.pictures {
            HStack {
            if let imageURL = picture.htmlURL {
                AsyncImage(url: URL(string: imageURL), content: { image in
                    image.resizable()
                }, placeholder: {
                    ProgressView()
                }).frame(width: 128, height: 128).clipShape(RoundedRectangle(cornerRadius:20))
            }
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
        ProgressView()
}
}
}

struct ImagesView_Previews: PreviewProvider {
    static var previews: some View {
        ImagesView()
    }
}
