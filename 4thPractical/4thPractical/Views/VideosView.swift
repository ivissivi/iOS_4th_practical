//
//  VideosView.swift
//  4thPractical
//
//  Created by user215333 on 5/21/22.
//

import SwiftUI

struct VideosView: View {
    var body: some View {
        List(0..<20) { item in
            VStack (alignment: .leading, spacing: 9) {
                Text("Title")
                    .fontWeight(.semibold)
                    .lineLimit(2)
                    .minimumScaleFactor(0.5)
                
                Text("Upload date")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}

struct VideosView_Previews: PreviewProvider {
    static var previews: some View {
        VideosView()
    }
}
