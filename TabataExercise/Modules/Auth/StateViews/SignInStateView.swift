//
//  SignInViewState.swift
//  TabataExercise
//
//  Created by Jan Vaverka on 25.08.2023.
//

import SwiftUI

struct SignInStateView: DynamicProperty {
    @EnvironmentObject private var userObject: UserObservableObject

    @State var email = ""
    @State var password = ""
    @State var errorMessage: String?

    func signIn() async {
        do {
            errorMessage = nil
            try await userObject.signInAndGetUser(withEmail: email, password: password)
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
