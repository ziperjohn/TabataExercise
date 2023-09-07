//
//  PrimaryButton.swift
//  TabataExercise
//
//  Created by Jan Vaverka on 23.08.2023.
//

import SwiftUI

struct PrimaryButton: View {
    let text: String
    let icon: Image
    let action: () -> Void
    let isDisabled: Bool

    var body: some View {
        Button(action: action) {
            HStack {
                Text(text)
                    .font(.headline)

                icon
                    .font(.headline)
            }
        }
        .padding()
        .foregroundColor(.white)
        .background(
            LinearGradient(gradient: Gradient(colors: [.yellow, .orange]), startPoint: .topLeading, endPoint: .bottomTrailing)
        )
        .cornerRadius(25)
        .opacity(isDisabled ? 0.5 : 1.0)
        .disabled(isDisabled)
    }
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton(text: "SIGN IN", icon: Image(systemName: "arrow.right.circle"), action: { print("Click") }, isDisabled: false)
    }
}
