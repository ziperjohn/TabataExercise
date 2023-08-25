//
//  ProfileScreen.swift
//  TabataExercise
//
//  Created by Jan Vaverka on 24.08.2023.
//

import SwiftUI

struct ProfileScreen: View {
    @EnvironmentObject var authViewState: AuthViewState

    var body: some View {
        if let user = authViewState.currentUser {
            Text("\(user.nickname)")
            Text("\(user.email)")

            PrimaryButton(text: "SIGN OUT", icon: Image(systemName: "arrow.right"), action: { authViewState.signOut() }, isDisabled: false)
            PrimaryButton(text: "DELETE USER", icon: Image(systemName: "xmark.bin"), action: { authViewState.deleteUser() }, isDisabled: false)
        }
    }
}

struct ProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreen()
            .environmentObject(AuthViewState())
    }
}
