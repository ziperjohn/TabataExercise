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
        NavigationStack {
            List {
                // MARK: - Profile info section

                Section {
                    ProfileInfoCard(initial: User.MOCK_USER.initial, nickname: User.MOCK_USER.nickname, email: User.MOCK_USER.email)
                }

                // MARK: - Workout history section

                Section {
                    NavigationLink(destination: WorkoutHistoryScreen()) {
                        HStack {
                            Image(systemName: "trophy")
                                .imageScale(.large)
                                .foregroundColor(.orange)
                            Text("Workout history")
                            Spacer()
                        }
                        .frame(height: 40)
                    }
                } header: {
                    Text("History")
                } footer: {
                    Text("45 workouts")
                }

                // MARK: - Account section

                Section("Account") {
                    ListRowProfile(title: "Sign out", icon: "arrow.backward.circle", action: state.showSignOutAlert, value: nil)
                        .alert(isPresented: state.$isSignOutAlertShowed) {
                            Alert(
                                title: Text("Are you sure?"),
                                message: Text("Do you really want to sign out?"),
                                primaryButton: .cancel(),
                                secondaryButton: .destructive(
                                    Text("Sign out"),
                                    action: { Task { try state.signOut() } }
                                )
                            )
                        }

                    ListRowProfile(title: "Delete account", icon: "person.badge.minus", action: state.showDeleteAccountAlert, value: nil)
                        .alert(isPresented: state.$isDeleteAccountAlertShowed) {
                            Alert(
                                title: Text("Are you sure?"),
                                message: Text("Do you really want to delete your account?"),
                                primaryButton: .cancel(),
                                secondaryButton: .destructive(
                                    Text("Delete"),
                                    action: { Task { try await state.deleteUser() }}
                                )
                            )
                        }
                }

                // MARK: - General section

                if let version = state.appVersion {
                    Section("General") {
                        ListRowProfile(title: "App version", icon: "gear", action: {}, value: version)
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
