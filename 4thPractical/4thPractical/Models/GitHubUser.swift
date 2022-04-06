//
//  GithubUser.swift
//  4thPractical
//
//  Created by user215333 on 4/6/22.
//

import Foundation

struct GitHubUser: Codable {
    let avatar_url: String?
    let name, company: String?
    let bio: String?
}

