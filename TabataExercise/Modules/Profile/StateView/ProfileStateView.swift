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

    @State private(set) var isDeleteAccountAlertShowed = false
    @State private(set) var isSignOutAlertShowed = false

    let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String

    // MARK: - Variables

    var currentUser: User? {
        userObject.currentUser
    }

    var nickname: String? {
        currentUser?.nickname
    }

    var email: String? {
        currentUser?.email
    }

    var workouts: [Workout]? {
        currentUser?.workouts
    }

    // MARK: - Functions

    func showDeleteAccountAlert() {
        isDeleteAccountAlertShowed.toggle()
    }

    func showSignOutAlert() {
        isSignOutAlertShowed.toggle()
    }

    func signOut() throws {
        do {
            try userObject.signOut()
        } catch {
            Log.error("\(error.localizedDescription)")
        }
    }

    func deleteUser() async throws {
        do {
            try await userObject.deleteUser()
        } catch {
            Log.error("\(error.localizedDescription)")
        }
    }
}
