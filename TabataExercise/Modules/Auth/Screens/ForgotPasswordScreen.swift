//
//  ForgotPasswordScreen.swift
//  TabataExercise
//
//  Created by Jan Vaverka on 23.08.2023.
//

import SwiftUI

struct ForgotPasswordScreen: View {
    let state = ForgotPasswordStateView()

    var body: some View {
        VStack(spacing: 25) {
            Spacer()

            // MARK: - Title

            AuthTitle(title: "Forgot password", subtitle: "Please reset your password")

            // MARK: - Text inputs

            TextInput(text: state.$email, title: "Email", placeHolder: "name@example.com", icon: "envelope")
                .autocapitalization(.none)

            // MARK: - Reset password button

            HStack {
                Spacer()
                PrimaryButton(text: "Reset password",
                              icon: "arrow.right",
                              isDisabled: !formIsValid,
                              action: { Task { await state.resetPassword() } })
            }.padding(.horizontal)

            Spacer()

            // MARK: - Message

            if let message = state.message {
                AlertMessage(text: message, color: .green)
            }

            // MARK: - Error message

            if let error = state.errorMessage {
                AlertMessage(text: error, color: .red)
            }
        }
    }
}

struct ForgotPasswordScreen_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordScreen()
            .environmentObject(UserObservableObject(authService: AuthService(), firestoreService: FirestoreService()))
    }
}

// MARK: - AuthenticationFormProtocol

extension ForgotPasswordScreen: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !state.email.isEmpty && state.email.contains("@") && state.email.contains(".")
    }
}
