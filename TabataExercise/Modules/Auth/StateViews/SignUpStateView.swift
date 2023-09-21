//
//  SignUpStateView.swift
//  TabataExercise
//
//  Created by Jan Vaverka on 25.08.2023.
//

import SwiftUI

struct SignUpStateView: DynamicProperty {
    @EnvironmentObject private var userObject: UserObservableObject

    @State var email = ""
    @State var nickname = ""
    @State var password = ""
    @State var confirmPassword = ""
    @State var errorMessage: String?

    func signUp() async {
        do {
            errorMessage = nil
            try await userObject.signUpAndCreateUser(withEmail: email, password: password, nickname: nickname)
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
