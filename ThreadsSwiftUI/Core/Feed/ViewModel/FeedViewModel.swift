//
//  FeedViewModel.swift
//  ThreadsSwiftUI
//
//  Created by 川尻辰義 on 2023/09/06.
//

import Foundation

@MainActor
final class FeedViewModel: ObservableObject {
    @Published var threads = [Thread]()
    
    init() {
        Task { try await fetchThreads() }
    }
    
    func fetchThreads() async throws {
        threads = try await ThreadService.fetchThreads()
        try await fetchUserDataForThreads()
    }
    
    private func fetchUserDataForThreads() async throws {
        for i in 0 ..< threads.count {
            let thread = threads[i]
            let threadUser = try await UserService.fetchUser(withUid: thread.ownerUid)
            threads[i].user = threadUser
        }
    }
}
