//
//  AuthService.swift
//  TabataExercise
//
//  Created by Jan Vaverka on 25.08.2023.
//

import Firebase
import FirebaseAuth
import Foundation

class AuthService {
    func signIn(withEmail email: String, password: String) async throws -> Firebase.User {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            return result.user
        } catch {
            Log.error("Faild to sign in with error: \(error.localizedDescription)")
            throw error
        }
    }

    func signUp(withEmail email: String, password: String) async throws -> Firebase.User {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            return result.user
        } catch {
            Log.error("Faild to sign up with error: \(error.localizedDescription)")
            throw error
        }
    }

    func signOut() throws {
        do {
            try Auth.auth().signOut()
        } catch {
            Log.error("Faild to sign out with error: \(error.localizedDescription)")
            throw error
        }
    }

    func resetPassword(withEmail email: String) async throws {
        do {
            try await Auth.auth().sendPasswordReset(withEmail: email)
        } catch {
            Log.error("Faild to reset password with error: \(error.localizedDescription)")
            throw error
        }
    }

    func deleteUser(user: Firebase.User) async throws {
        do {
            try await user.delete()
        } catch {
            Log.error("Faild to delete user with error: \(error.localizedDescription)")
            throw error
        }
    }
}
