//
//  LoginViewModel.swift
//  ThreadsSwiftUI
//
//  Created by 川尻辰義 on 2023/09/04.
//

import Foundation

final class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    @MainActor
    func login() async throws {
        try await AuthService.shared.login(withEmail: email, password: password)
    }
}
