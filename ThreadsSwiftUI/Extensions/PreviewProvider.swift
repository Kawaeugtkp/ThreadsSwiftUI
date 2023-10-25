//
//  PreviewProvider.swift
//  ThreadsSwiftUI
//
//  Created by 川尻辰義 on 2023/09/04.
//

import SwiftUI
import Firebase

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.shared
    }
}

final class DeveloperPreview {
    static let shared = DeveloperPreview()
    
    let user = User(id: NSUUID().uuidString, fullname: "Max Stephan", email: "max@gmail.com", username: "max")
    
    let thread = Thread(ownerUid: "123", caption: "This is a test thread.", timestamp: Timestamp(), likes: 0)
}
