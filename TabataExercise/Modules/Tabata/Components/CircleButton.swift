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
    let isDisabled: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(systemName: icon)
                .font(.title)
                .foregroundColor(.white)
                .frame(width: size, height: size)
                .background(mainLinearGradient)
                .clipShape(Circle())
                .opacity(isDisabled ? 0.5 : 1.0)
        }
        .disabled(isDisabled)
    }
}

struct CircleButton_Previews: PreviewProvider {
    static var previews: some View {
        CircleButton(icon: "play", size: 90, isDisabled: false, action: { print("Play") })
    }
}
