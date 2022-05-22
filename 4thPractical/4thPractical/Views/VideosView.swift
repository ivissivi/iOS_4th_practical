//
//  VideosView.swift
//  4thPractical
//
//  Created by user215333 on 5/21/22.
//

import SwiftUI

struct VideosView: View {
    
    @EnvironmentObject var downloadManager: DownloadManager
    @State private var showVideo = false
    
    var body: some View {
        
        VStack(spacing: 40) {
                   DownloadButton()

                   if downloadManager.isDownloaded {
                       WatchButton()
                           .onTapGesture {
                               showVideo = true
                           }
                           .fullScreenCover(isPresented: $showVideo, content: {
                               VideoView()
                           })
                   }
               }
               .padding(.horizontal, 20)
               .onAppear {
                   downloadManager.checkFileExists()
               }
        
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
