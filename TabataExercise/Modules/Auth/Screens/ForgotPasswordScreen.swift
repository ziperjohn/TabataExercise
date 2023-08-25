//
//  ForgotPasswordScreen.swift
//  TabataExercise
//
//  Created by Jan Vaverka on 23.08.2023.
//

import SwiftUI

struct ForgotPasswordScreen: View {
    @State private var email = ""

    @EnvironmentObject var authViewState: AuthViewState

    var body: some View {
        VStack(spacing: 25) {
            Spacer()

            // Title

            AuthTitle(title: "Forgot password", subtitle: "Please reset your password")

            // Text inputs

            TextInput(text: $email, title: "Email", placeHolder: "name@example.com", icon: Image(systemName: "envelope"))
                .autocapitalization(.none)

            // Reset password button

            HStack {
                Spacer()
                PrimaryButton(text: "Reset password",
                              icon: Image(systemName: "arrow.right"),
                              action: { Task { try await authViewState.resetPassword(withEmail: email) } },
                              isDisabled: false)
            }.padding(.horizontal)

            // Message

            if let message = authViewState.message {
                Text(message)
                    .foregroundColor(.green)
            }

            // Error message

            if let error = authViewState.errorMessage {
                Text(error)
                    .foregroundColor(.red)
            }

            Spacer()
        }
    }
}

struct ForgotPasswordScreen_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordScreen()
            .environmentObject(AuthViewState())
    }
}
