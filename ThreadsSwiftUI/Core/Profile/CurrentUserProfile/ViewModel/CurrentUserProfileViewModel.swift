//
//  CurrentUserProfileViewModel.swift
//  ThreadsSwiftUI
//
//  Created by 川尻辰義 on 2023/09/04.
//

import Combine

final class CurrentUserProfileViewModel: ObservableObject {
    @Published var currentUser: User?
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupSubscribers()
    }
    
    private func setupSubscribers() {
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.currentUser = user
        }.store(in: &cancellables)
    }
}
