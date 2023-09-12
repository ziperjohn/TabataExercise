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

            // Title

            AuthTitle(title: "Forgot password", subtitle: "Please reset your password")

            // Text inputs

            TextInput(text: state.$email, title: "Email", placeHolder: "name@example.com", icon: "envelope")
                .autocapitalization(.none)

            // Reset password button

            HStack {
                Spacer()
                PrimaryButton(text: "Reset password",
                              icon: "arrow.right",
                              action: { Task { try await state.resetPassword() } },
                              isDisabled: !formIsValid)
            }.padding(.horizontal)

            Spacer()

            // Message

            if let message = state.message {
                AlertMessage(text: message, color: .green)
            }

            // Error message

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
