//
//  SignUpScreen.swift
//  TabataExercise
//
//  Created by Jan Vaverka on 23.08.2023.
//

import SwiftUI

struct SignUpScreen: View {
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""

    var body: some View {
        VStack(spacing: 25) {
            Spacer()

            // Title

            AuthTitle(title: "Sign up", subtitle: "Please create a new account")

            // Text inputs

            TextInput(text: $email, title: "Email", placeHolder: "name@example.com", icon: Image(systemName: "envelope"))
            TextInput(text: $password, title: "Password", placeHolder: "Enter your password", icon: Image(systemName: "lock"), isSecureField: true)
            TextInput(text: $password, title: "Confirm password", placeHolder: "Confirm your password", icon: Image(systemName: "lock"), isSecureField: true)

            // Sign in button

            HStack {
                Spacer()
                PrimaryButton(text: "SIGN UP", icon: Image(systemName: "arrow.right"), action: { print("Sign up") }, isDisabled: false)
            }.padding(.horizontal)

            Spacer()

            // Sign in footer link

            FotterNavigation(isSignInView: false)
        }
    }
}

struct SignUpScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignUpScreen()
    }
}
