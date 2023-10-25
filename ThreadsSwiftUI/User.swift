//
//  User.swift
//  ThreadsSwiftUI
//
//  Created by 川尻辰義 on 2023/09/04.
//

import Foundation

struct User: Identifiable, Codable, Hashable {
    let id: String
    let fullname: String
    let email: String
    let username: String
    var profileImageUrl: String?
    var bio: String?
}
