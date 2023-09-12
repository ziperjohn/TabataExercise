//
//  CircleButton.swift
//  TabataExercise
//
//  Created by Jan Vaverka on 28.08.2023.
//

import SwiftUI

struct CircleButton: View {
    let icon: String
    let size: CGFloat
    let action: () -> Void
    let isDisabled: Bool

    var body: some View {
        Button(action: action) {
            Image(systemName: icon)
                .font(.title)
                .frame(width: size, height: size)
                .foregroundColor(Color.white)
                .background(
                    LinearGradient(gradient: Gradient(colors: [.yellow, .orange]), startPoint: .topLeading, endPoint: .bottomTrailing)
                )
                .clipShape(Circle())
                .opacity(isDisabled ? 0.5 : 1.0)
        }
        .disabled(isDisabled)
    }
}

struct CircleButton_Previews: PreviewProvider {
    static var previews: some View {
        CircleButton(icon: "play", size: 90, action: { print("Play") }, isDisabled: false)
    }
}
