//
//  _thPracticalApp.swift
//  4thPractical
//
//  Created by user215333 on 4/6/22.
//

import SwiftUI

@main
struct _thPracticalApp: App {
    
    var downloadManagerVideo = DownloadManager()
    var downloadManagerImage = DownloadManagerImage()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(downloadManagerVideo)
                .environmentObject(downloadManagerImage)
        }
    }
}
