//
//  Thread.swift
//  ThreadsSwiftUI
//
//  Created by 川尻辰義 on 2023/09/06.
//

import Firebase
import FirebaseFirestoreSwift

struct Thread:Identifiable, Codable {
    @DocumentID var threadId: String?
    let ownerUid: String
    let caption: String
    let timestamp: Timestamp
    var likes: Int
    
    var id: String {
        return threadId ?? NSUUID().uuidString
    }
    
    var user: User?
}
