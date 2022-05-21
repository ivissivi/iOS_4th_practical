//
//  HomeViewModel.swift
//  4thPractical
//
//  Created by user215333 on 4/6/22.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var user: GitHubUser?
    @Published var pictures: GitHubPictures?
    
    init(){
        getGitHubUser()
    }
    
    private func getGitHubUser() {
        Task {
            do {
                user = try await UserService.shared.getGitHubUser()
                //pictures = try await UserService.shared.getGitHubPictures()
            } catch {
                print("download failed")
            }
        }
    }
}

