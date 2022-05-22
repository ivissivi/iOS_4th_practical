//
//  UserService.swift
//  4thPractical
//
//  Created by user215333 on 4/6/22.
//

import Foundation

class UserService {
    let kUserUrlString = "https://api.github.com/users/ioslekcijas/repos"
    let filesStringUrl = "https://api.github.com/repos/ioslekcijas/faili/contents/"
    
    static let shared = UserService()
    
    private init() { }
        @MainActor func getGitHubUser() async throws -> GitHubUser? {
            guard let url = URL(string: "https://api.github.com/users/ioslekcijas") else {
                fatalError("missing url") }
            
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "GET"
            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            
            guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError( "Error while fetching data")}
            
            return try JSONDecoder().decode(GitHubUser.self, from: data)
    }
}


