//
//  SignInScreen.swift
//  TabataExercise
//
//  Created by Jan Vaverka on 23.08.2023.
//

import SwiftUI

struct SignInScreen: View {
    @State private var email = ""
    @State private var password = ""

    @EnvironmentObject var authViewState: AuthViewState

    var body: some View {
        NavigationStack {
            VStack(spacing: 25) {
                Spacer()

                // Title

                AuthTitle(title: "Sign in", subtitle: "Please sign in to continue")

                // Text inputs

                TextInput(text: $email, title: "Email", placeHolder: "name@example.com", icon: Image(systemName: "envelope"))
                    .autocapitalization(.none)

                ZStack(alignment: .trailing) {
                    TextInput(text: $password, title: "Password", placeHolder: "Enter your password", icon: Image(systemName: "lock"), isSecureField: true)

                    NavigationLink(destination: ForgotPasswordScreen()) {
                        Text("FORGOT")
                            .font(.footnote)
                            .fontWeight(.heavy)
                            .foregroundColor(.orange)
                            .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 30))
                    }
                }

                // Sign in button

                HStack {
                    Spacer()
                    PrimaryButton(text: "SIGN IN",
                                  icon: Image(systemName: "arrow.right"),
                                  action: { Task { try await authViewState.signIn(withEmail: email, password: password) } },
                                  isDisabled: !formIsValid)
                }.padding(.horizontal)

                // Error message

                if let error = authViewState.errorMessage {
                    Text(error)
                        .foregroundColor(.red)
                }

                Spacer()

                // Sign up footer link

                FotterNavigation(isSignInView: true)
            }
        }.tint(.orange)
    }
}

struct SignInScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignInScreen()
            .environmentObject(AuthViewState())
    }
}

// MARK: - AuthenticationFormProtocol

extension SignInScreen: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty && email.contains("@") && email.contains(".") && !password.isEmpty && password.count > 5
    }
}
