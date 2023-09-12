//
//  SignUpScreen.swift
//  TabataExercise
//
//  Created by Jan Vaverka on 23.08.2023.
//

import SwiftUI

struct SignUpScreen: View {
    let state = SignUpStateView()

    var body: some View {
        VStack(spacing: 20) {
            Spacer()

            // Title

            AuthTitle(title: "Sign up", subtitle: "Please create a new account")

            // Text inputs

            TextInput(text: state.$email, title: "Email", placeHolder: "name@example.com", icon: "envelope")
                .autocapitalization(.none)

            TextInput(text: state.$nickname, title: "Nickname", placeHolder: "Enter your nickname", icon: "person")

            TextInput(text: state.$password, title: "Password", placeHolder: "Enter your password", icon: "lock", isSecureField: true)

            ZStack(alignment: .trailing) {
                TextInput(text: state.$confirmPassword, title: "Confirm password", placeHolder: "Confirm your password", icon: "lock", isSecureField: true)

                if !state.password.isEmpty && !state.confirmPassword.isEmpty {
                    if state.password == state.confirmPassword {
                        Image(systemName: "checkmark.circle.fill")
                            .imageScale(.large)
                            .fontWeight(.bold)
                            .foregroundColor(Color(.systemGreen))
                            .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 30))
                    } else {
                        Image(systemName: "xmark.circle.fill")
                            .imageScale(.large)
                            .fontWeight(.bold)
                            .foregroundColor(Color(.systemRed))
                            .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 30))
                    }
                }
            }

            // Sign up button

            HStack {
                Spacer()
                PrimaryButton(text: "SIGN UP",
                              icon: "arrow.right",
                              action: { Task { try await state.signUp() } },
                              isDisabled: !formIsValid)
            }.padding(.horizontal)

            Spacer()
            // Error message

            if let error = state.errorMessage {
                AlertMessage(text: error, color: .red)
            }

            // Sign in footer link

            FotterNavigation(isSignInView: false)
        }
    }
}

struct SignUpScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignUpScreen()
            .environmentObject(UserObservableObject(authService: AuthService(), firestoreService: FirestoreService()))
    }
}

// MARK: - AuthenticationFormProtocol

extension SignUpScreen: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !state.email.isEmpty && state.email.contains("@") && state.email.contains(".") && !state.password.isEmpty && state.password.count > 5 && state.confirmPassword == state.password
    }
}
