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
        
        VStack(spacing: 20) {
                   DownloadButtonVideo()

                   if downloadManager.isDownloaded {
                       WatchButtonVideo()
                           .onTapGesture {
                               showVideo = true
                           }
                           .fullScreenCover(isPresented: $showVideo, content: {
                               VideoView()
                           })
                   }
            Spacer()
               }
               .padding(.horizontal, 20)
               .onAppear {
                   downloadManager.checkFileExists()
               }
    }
}

struct VideosView_Previews: PreviewProvider {
    static var previews: some View {
        VideosView()
    }
}
