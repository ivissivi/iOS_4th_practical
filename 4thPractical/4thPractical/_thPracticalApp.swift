//
//  _thPracticalApp.swift
//  4thPractical
//
//  Created by user215333 on 4/6/22.
//

import SwiftUI

@main
struct _thPracticalApp: App {
    
    var downloadManager = DownloadManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(downloadManager)
        }
    }
}
