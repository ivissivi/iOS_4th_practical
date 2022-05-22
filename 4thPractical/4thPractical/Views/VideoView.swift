//
//  VideoView.swift
//  4thPractical
//
//  Created by user215333 on 5/22/22.
//

import SwiftUI
import AVKit

struct VideoView: View {
    
    @EnvironmentObject var downloadManager: DownloadManager
        @State var player = AVPlayer()

    
    var body: some View {
        VideoPlayer(player: player)
                  .edgesIgnoringSafeArea(.all)
                  .onAppear {
                      let playerItem = downloadManager.getVideoFileAsset()
                      if let playerItem = playerItem {
                          player = AVPlayer(playerItem: playerItem)
                      }
                      player.play()
                  }
    }
}

struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        VideoView()
    }
}
