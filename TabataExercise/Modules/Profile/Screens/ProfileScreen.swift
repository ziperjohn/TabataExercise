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
        VStack {
            if state.currentUser != nil {
                if let nickname = state.nickname {
                    Text(nickname)
                }

                if let email = state.email {
                    Text(email)
                }

                PrimaryButton(text: "SIGN OUT", icon: Image(systemName: "arrow.right"), action: { Task { try state.signOut() } }, isDisabled: false)
                PrimaryButton(text: "DELETE USER", icon: Image(systemName: "xmark.bin"), action: { Task { try await state.deleteUser() } }, isDisabled: false)
            }

            PrimaryButton(text: "SIGN OUT", icon: Image(systemName: "arrow.right"), action: { Task { try state.signOut() } }, isDisabled: false)
        }
    }
}

struct ProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreen()
            .environmentObject(UserObservableObject(authService: AuthService(), firestoreService: FirestoreService()))
    }
}
