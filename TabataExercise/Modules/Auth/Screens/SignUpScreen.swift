//
//  SignUpScreen.swift
//  TabataExercise
//
//  Created by Jan Vaverka on 23.08.2023.
//

import SwiftUI

struct SignUpScreen: View {
    @State private var email = ""
    @State private var nickname = ""
    @State private var password = ""
    @State private var confirmPassword = ""

    @EnvironmentObject var authViewState: AuthViewState

    var body: some View {
        VStack(spacing: 20) {
            Spacer()

            // Title

            AuthTitle(title: "Sign up", subtitle: "Please create a new account")

            // Text inputs

            TextInput(text: $email, title: "Email", placeHolder: "name@example.com", icon: Image(systemName: "envelope"))
                .autocapitalization(.none)

            TextInput(text: $nickname, title: "Nickname", placeHolder: "Enter your nickname", icon: Image(systemName: "person"))

            TextInput(text: $password, title: "Password", placeHolder: "Enter your password", icon: Image(systemName: "lock"), isSecureField: true)

            ZStack(alignment: .trailing) {
                TextInput(text: $confirmPassword, title: "Confirm password", placeHolder: "Confirm your password", icon: Image(systemName: "lock"), isSecureField: true)

                if !password.isEmpty && !confirmPassword.isEmpty {
                    if password == confirmPassword {
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
                              icon: Image(systemName: "arrow.right"),
                              action: { Task { try await authViewState.createUser(withEmail: email, password: password, nickname: nickname) } },
                              isDisabled: !formIsValid)
            }.padding(.horizontal)

            // Error message

            if let error = authViewState.errorMessage {
                Text(error)
                    .foregroundColor(.red)
            }

            Spacer()

            // Sign in footer link

            FotterNavigation(isSignInView: false)
        }
    }
}

struct SignUpScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignUpScreen()
            .environmentObject(AuthViewState())
    }
}

// MARK: - AuthenticationFormProtocol

extension SignUpScreen: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty && email.contains("@") && email.contains(".") && !password.isEmpty && password.count > 5 && confirmPassword == password
    }
}
