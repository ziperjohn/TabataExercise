//
//  SignInScreen.swift
//  TabataExercise
//
//  Created by Jan Vaverka on 23.08.2023.
//

import SwiftUI

struct SignInScreen: View {
    let state = SignInStateView()

    var body: some View {
        NavigationStack {
            VStack(spacing: 25) {
                Spacer()

                // MARK: - Title

                AuthTitle(title: "Sign in", subtitle: "Please sign in to continue")

                // MARK: - Text inputs

                TextInput(text: state.$email, title: "Email", placeHolder: "name@example.com", icon: "envelope")
                    .autocapitalization(.none)

                ZStack(alignment: .trailing) {
                    TextInput(text: state.$password, title: "Password", placeHolder: "Enter your password", icon: "lock", isSecureField: true)

                    NavigationLink(destination: ForgotPasswordScreen()) {
                        Text("FORGOT")
                            .font(.footnote)
                            .fontWeight(.heavy)
                            .foregroundColor(.orange)
                            .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 30))
                    }
                }

                // MARK: - Sign in button

                HStack {
                    Spacer()
                    PrimaryButton(text: "SIGN IN",
                                  icon: "arrow.right",
                                  isDisabled: !formIsValid,
                                  action: { Task { await state.signIn() }})
                }.padding(.horizontal)

                Spacer()

                // MARK: - Error message

                if let error = state.errorMessage {
                    AlertMessage(text: error, color: .red)
                }

                // MARK: - Sign up footer link

                FotterNavigation(isSignInView: true)
            }
        }.tint(.orange)
    }
}

struct SignInScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignInScreen()
            .environmentObject(UserObservableObject(authService: AuthService(), firestoreService: FirestoreService()))
    }
}

// MARK: - AuthenticationFormProtocol

extension SignInScreen: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !state.email.isEmpty && state.email.contains("@") && state.email.contains(".") && !state.password.isEmpty && state.password.count > 5
    }
}
