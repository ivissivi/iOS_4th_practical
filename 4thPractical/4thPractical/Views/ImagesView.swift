//
//  ImagesView.swift
//  4thPractical
//
//  Created by user215333 on 5/21/22.
//

import SwiftUI

struct ImagesView: View {
    
    @EnvironmentObject var downloadManager: DownloadManagerImage
    @State var results = [GitHubPictures]()
    
    var body: some View {
        VStack(spacing: 20) {
                   DownloadButtonImage()
                   if downloadManager.isDownloaded {
                       ImageItem()
                   }
            Spacer()
               }
               .padding(.horizontal, 20)
               .onAppear {
                   downloadManager.checkFileExists()
               }
            }
    }


struct ImagesView_Previews: PreviewProvider {
    static var previews: some View {
        ImagesView()
    }
}
