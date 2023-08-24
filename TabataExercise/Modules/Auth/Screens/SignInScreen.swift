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

    var body: some View {
        NavigationStack {
            VStack(spacing: 25) {
                Spacer()

                // Title

                AuthTitle(title: "Sign in", subtitle: "Please sign in to continue")

                // Text inputs

                TextInput(text: $email, title: "Email", placeHolder: "name@example.com", icon: Image(systemName: "envelope"))
                TextInput(text: $password, title: "Password", placeHolder: "Enter your password", icon: Image(systemName: "lock"), isSecureField: true, showForgotButton: true)

                // Sign in button

                HStack {
                    Spacer()
                    PrimaryButton(text: "SIGN IN", icon: Image(systemName: "arrow.right"), action: { print("Sign in") }, isDisabled: false)
                }.padding(.horizontal)

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
    }
}
