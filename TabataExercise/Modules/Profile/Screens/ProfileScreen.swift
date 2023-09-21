//
//  ProfileScreen.swift
//  TabataExercise
//
//  Created by Jan Vaverka on 24.08.2023.
//

import SwiftUI

struct ProfileScreen: View {
    let state = ProfileStateView()

    var body: some View {
        NavigationStack(path: state.$coordinator.stackPath) {
            List {
                // MARK: - Profile info section

                if let user = state.currentUser {
                    Section {
                        ProfileInfoCard(initial: user.initial, nickname: user.nickname, email: user.email)
                    }
                }

                // MARK: - Workout history section

                if let workouts = state.workouts {
                    Section {
                        ListRowProfile(title: "Workout history", icon: "trophy", value: nil, action: { state.coordinator.stackPath.append(.history) })
                            .navigationDestination(for: Route.self) { _ in
                                state.coordinator.workoutHistoryScreen(wokrouts: workouts)
                            }
                    } header: {
                        Text("History")
                    } footer: {
                        Text("\(workouts.count) workouts")
                    }
                }

                // MARK: - Account section

                Section("Account") {
                    ListRowProfile(title: "Sign out", icon: "arrow.backward.circle", value: nil, action: state.showSignOutAlert)
                        .alert(isPresented: state.$isSignOutAlertShowed) {
                            Alert(
                                title: Text("Are you sure?"),
                                message: Text("Do you really want to sign out?"),
                                primaryButton: .cancel(),
                                secondaryButton: .destructive(
                                    Text("Sign out"),
                                    action: { state.signOut() }
                                )
                            )
                        }

                    ListRowProfile(title: "Delete account", icon: "person.badge.minus", value: nil, action: state.showDeleteAccountAlert)
                        .alert(isPresented: state.$isDeleteAccountAlertShowed) {
                            Alert(
                                title: Text("Are you sure?"),
                                message: Text("Do you really want to delete your account?"),
                                primaryButton: .cancel(),
                                secondaryButton: .destructive(
                                    Text("Delete"),
                                    action: { Task { await state.deleteUser() }}
                                )
                            )
                        }
                }

                // MARK: - General section

                if let version = state.appVersion {
                    Section("General") {
                        ListRowProfile(title: "App version", icon: "gear", value: version, action: {})
                    }
                }
            }
        }
    }
}

struct ProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreen()
            .environmentObject(UserObservableObject(authService: AuthService(), firestoreService: FirestoreService()))
    }
}
