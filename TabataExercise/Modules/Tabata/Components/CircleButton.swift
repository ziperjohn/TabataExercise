//
//  CircleButton.swift
//  TabataExercise
//
//  Created by Jan Vaverka on 28.08.2023.
//

import SwiftUI

struct CircleButton: View {
    let icon: Image
    let size: CGFloat
    let action: () -> Void
    var body: some View {
        Button(action: { action() }) {
            icon
                .font(.title)
                .frame(width: size, height: size)
                .foregroundColor(Color.white)
                .background(
                    LinearGradient(gradient: Gradient(colors: [.yellow, .orange]), startPoint: .topLeading, endPoint: .bottomTrailing)
                )
                .clipShape(Circle())
        }
    }
}

struct CircleButton_Previews: PreviewProvider {
    static var previews: some View {
        CircleButton(icon: Image(systemName: "play"), size: 90, action: { print("Play") })
    }
}
