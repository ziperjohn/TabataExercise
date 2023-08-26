//
//  AuthViewState.swift
//  TabataExercise
//
//  Created by Jan Vaverka on 24.08.2023.
//

import Firebase
import FirebaseFirestoreSwift
import Foundation

protocol AuthenticationFormProtocol {
    var formIsValid: Bool { get }
}

@MainActor
class AuthViewState: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    @Published var errorMessage: String?
    @Published var message: String?

    init() {
        self.userSession = Auth.auth().currentUser

        Task {
            await self.fetchUser()
        }
    }

    func signIn(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            await self.fetchUser()
        } catch {
            Log.error("Faild to sign in with error: \(error.localizedDescription)")
            self.errorMessage = error.localizedDescription
        }
    }

    func createUser(withEmail email: String, password: String, nickname: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            let user = User(id: result.user.uid, nickname: nickname, email: email)
            let encodedUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
            await self.fetchUser()
        } catch {
            Log.error("Faild to create user with error: \(error.localizedDescription)")
            self.errorMessage = error.localizedDescription
        }
    }

    func resetPassword(withEmail email: String) async throws {
        do {
            try await Auth.auth().sendPasswordReset(withEmail: email)
            self.message = "Email has been sent check your email: \(email)"
        } catch {
            Log.error("Faild to reset password with error: \(error.localizedDescription)")
            self.errorMessage = error.localizedDescription
        }
    }

    func signOut() {
        do {
            try Auth.auth().signOut()
            self.userSession = nil
            self.currentUser = nil
        } catch {
            Log.error("Faild to sign out with error: \(error.localizedDescription)")
            self.errorMessage = error.localizedDescription
        }
    }

    func deleteUser() {
        self.userSession?.delete { error in
            if let error = error {
                Log.error("Faild to delete user with error: \(error.localizedDescription)")
                self.errorMessage = error.localizedDescription
            } else {
                Log.info("User was deleted")
                self.signOut()
            }
        }
    }

    func fetchUser() async {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else { return }
        self.currentUser = try? snapshot.data(as: User.self)
    }
}
