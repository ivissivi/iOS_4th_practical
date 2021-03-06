//
//  DownloadManager.swift
//  4thPractical
//
//  Created by user215333 on 5/22/22.
//

import Foundation

import Foundation
import AVKit

final class DownloadManager: ObservableObject {
    
    @Published var isDownloading = false
    @Published var isDownloaded = false
    let downloadLink = "https://raw.githubusercontent.com/ioslekcijas/faili/master/Teddy%20Blueger%20scores%20two%20goals%20against%20Rangers.mp4"

    
// MARK: - Download process
    
    func downloadFile() {
        print("downloadFile")
        isDownloading = true

        let docsUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first

        let destinationUrl = docsUrl?.appendingPathComponent("myVideo.mp4")
        if let destinationUrl = destinationUrl {
            if (FileManager().fileExists(atPath: destinationUrl.path)) {
                print("File already exists")
                isDownloading = false
            } else {
                let urlRequest = URLRequest(url: URL(string: downloadLink)!)

                let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in

                    if let error = error {
                        print("Request error: ", error)
                        self.isDownloading = false
                        return
                    }

                    guard let response = response as? HTTPURLResponse else { return }

                    if response.statusCode == 200 {
                        guard let data = data else {
                            self.isDownloading = false
                            return
                        }
                        DispatchQueue.main.async {
                            do {
                                try data.write(to: destinationUrl, options: Data.WritingOptions.atomic)

                                DispatchQueue.main.async {
                                    self.isDownloading = false
                                    self.isDownloaded = true
                                }
                            } catch let error {
                                print("Error decoding: ", error)
                                self.isDownloading = false
                            }
                        }
                    }
                }
                dataTask.resume()
            }
        }
    }
    
// MARK: - Delete process

    func deleteFile() {
        let docsUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first

        let destinationUrl = docsUrl?.appendingPathComponent("myVideo.mp4")
        if let destinationUrl = destinationUrl {
            guard FileManager().fileExists(atPath: destinationUrl.path) else { return }
            do {
                try FileManager().removeItem(atPath: destinationUrl.path)
                print("File deleted successfully")
                isDownloaded = false
            } catch let error {
                print("Error while deleting video file: ", error)
            }
        }
    }
    
// MARK: - Check if file exists process

    func checkFileExists() {
        let docsUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first

        let destinationUrl = docsUrl?.appendingPathComponent("myVideo.mp4")
        if let destinationUrl = destinationUrl {
            if (FileManager().fileExists(atPath: destinationUrl.path)) {
                isDownloaded = true
            } else {
                isDownloaded = false
            }
        } else {
            isDownloaded = false
        }
    }

    func getVideoFileAsset() -> AVPlayerItem? {
        let docsUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first

        let destinationUrl = docsUrl?.appendingPathComponent("myVideo.mp4")
        if let destinationUrl = destinationUrl {
            if (FileManager().fileExists(atPath: destinationUrl.path)) {
                let avAssest = AVAsset(url: destinationUrl)
                return AVPlayerItem(asset: avAssest)
            } else {
                return nil
            }
        } else {
            return nil
        }
    }
}
