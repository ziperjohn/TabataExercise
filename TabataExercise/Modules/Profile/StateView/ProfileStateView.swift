//
//  ProfileStateView.swift
//  TabataExercise
//
//  Created by Jan Vaverka on 25.08.2023.
//

import Firebase
import SwiftUI

struct ProfileStateView: DynamicProperty {
    @EnvironmentObject private var userObject: UserObservableObject
    @State var errorMessage: String?

    var currentUser: User? {
        userObject.currentUser
    }

    var nickname: String? {
        currentUser?.nickname
    }

    var email: String? {
        currentUser?.email
    }

    func signOut() throws {
        do {
            try userObject.signOut()
        } catch {
            errorMessage = error.localizedDescription
        }
    }

    func deleteUser() async throws {
        do {
            try await userObject.deleteUser()
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
