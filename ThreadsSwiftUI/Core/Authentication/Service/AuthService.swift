//
//  AuthService.swift
//  ThreadsSwiftUI
//
//  Created by 川尻辰義 on 2023/09/04.
//

import Firebase
import FirebaseFirestoreSwift

final class AuthService {
    @Published var userSession: FirebaseAuth.User?
    
    static let shared = AuthService() // このsharedの意味はuserSessionをアプリ内で一つだけ利用するようにするため。複数あったら大変
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    @MainActor
    func login(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            try await UserService.shared.fetchCurrentUser()
        } catch {
            print("DEBUG: Failed to create user with error \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func createUser(withEmail email: String, password: String, fullname: String, username: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            try await uploadUserData(id: result.user.uid, withEmail: email, fullname: fullname, username: username)
        } catch {
            print("DEBUG: Failed to create user with error \(error.localizedDescription)")
        }
    }
    
    func signOut() {
        try? Auth.auth().signOut() // signs out on backend
        self.userSession = nil // this removes session locally and updates logging
        UserService.shared.reset() // sets current user object to nil
    }
    
    @MainActor
    private func uploadUserData(id: String, withEmail email: String, fullname: String, username: String) async throws {
        let user = User(id: id, fullname: fullname, email: email, username: username)
        guard let userData = try? Firestore.Encoder().encode(user) else { return }
        try await Firestore.firestore().collection("users").document(id).setData(userData)
        UserService.shared.currentUser = user
    }
}
