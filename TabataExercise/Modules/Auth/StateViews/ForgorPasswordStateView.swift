//
//  ForgorPasswordStateView.swift
//  TabataExercise
//
//  Created by Jan Vaverka on 25.08.2023.
//

import SwiftUI

struct ForgotPasswordStateView: DynamicProperty {
    @EnvironmentObject private var userObject: UserObservableObject

    @State var email = ""
    @State var message: String?
    @State var errorMessage: String?

    func resetPassword() async throws {
        do {
            message = nil
            errorMessage = nil
            try await userObject.resetPassword(withEmail: email)
            message = "Email has been sent, check your email!"
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
