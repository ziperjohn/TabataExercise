//
//  FotterNavigation.swift
//  TabataExercise
//
//  Created by Jan Vaverka on 23.08.2023.
//

import SwiftUI

struct FotterNavigation: View {
    let isSignInView: Bool

    @Environment(\.dismiss) var dismiss

    var body: some View {
        if isSignInView {
            NavigationLink(destination: SignUpScreen()
                .navigationBarBackButtonHidden(true))
            {
                HStack(spacing: 4) {
                    Text("Don't have an account?")
                        .foregroundColor(.gray)
                        .fontWeight(.semibold)
                    Text("Sign up")
                        .foregroundColor(.orange)
                        .fontWeight(.heavy)
                }
                .font(.system(size: 15))
            }
        } else {
            Button {
                dismiss()
            } label: {
                HStack(spacing: 4) {
                    Text("Already have an account?")
                        .foregroundColor(.gray)
                        .fontWeight(.semibold)
                    Text("Sign in")
                        .foregroundColor(.orange)
                        .fontWeight(.heavy)
                }
                .font(.system(size: 14))
            }
        }
    }
}

struct FotterNavigation_Previews: PreviewProvider {
    static var previews: some View {
        FotterNavigation(isSignInView: true)
    }
}
