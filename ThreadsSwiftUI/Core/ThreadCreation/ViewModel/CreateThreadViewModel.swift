//
//  CreateThreadViewModel.swift
//  ThreadsSwiftUI
//
//  Created by 川尻辰義 on 2023/09/06.
//

import Firebase
import Combine

final class CreateThreadViewModel: ObservableObject {
    @Published var user: User?
    @Published var caption = ""
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupSubscribers()
    }
    
    private func setupSubscribers() {
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.user = user
        }.store(in: &cancellables)
    }
    
    func uploadThread() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let thread = Thread(ownerUid: uid, caption: caption, timestamp: Timestamp(), likes: 0)
        try await ThreadService.uploadThread(thread)
    }
}
