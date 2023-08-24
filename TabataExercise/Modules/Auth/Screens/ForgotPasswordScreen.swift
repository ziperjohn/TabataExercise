//
//  ForgotPasswordScreen.swift
//  TabataExercise
//
//  Created by Jan Vaverka on 23.08.2023.
//

import SwiftUI

struct ForgotPasswordScreen: View {
    @State private var email = ""

    var body: some View {
        VStack(spacing: 25) {
            Spacer()

            // Title

            AuthTitle(title: "Forgot password", subtitle: "Please reset your password")

            // Text inputs

            TextInput(text: $email, title: "Email", placeHolder: "name@example.com", icon: Image(systemName: "envelope"))

            // Sign in button

            HStack {
                Spacer()
                PrimaryButton(text: "Reset password", icon: Image(systemName: "arrow.right"), action: { print("Reset password") }, isDisabled: false)
            }.padding(.horizontal)

            Spacer()
        }
    }
}

struct ForgotPasswordScreen_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordScreen()
    }
}
