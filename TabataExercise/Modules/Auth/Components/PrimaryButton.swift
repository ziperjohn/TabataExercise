//
//  PrimaryButton.swift
//  TabataExercise
//
//  Created by Jan Vaverka on 23.08.2023.
//

import SwiftUI

struct PrimaryButton: View {
    let text: String
    let icon: String
    let isDisabled: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                Text(text)
                    .font(.headline)

                Image(systemName: icon)
                    .font(.headline)
            }
        }
        .padding()
        .foregroundColor(.white)
        .background(mainLinearGradient)
        .cornerRadius(25)
        .opacity(isDisabled ? 0.5 : 1.0)
        .disabled(isDisabled)
    }
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton(text: "SIGN IN", icon: "arrow.right.circle", isDisabled: false, action: { print("Click") })
    }
}
