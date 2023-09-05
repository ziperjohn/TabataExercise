//
//  CircleSettingsButton.swift
//  TabataExercise
//
//  Created by Jan Vaverka on 01.09.2023.
//

import SwiftUI

struct CircleSettingsButton: View {
    let isDisabled: Bool

    var body: some View {
        NavigationLink(destination: TabataSettingsScreen()) {
            Image(systemName: "gearshape")
                .font(.title)
                .foregroundColor(.white)
                .frame(width: 75, height: 75)
                .background(
                    LinearGradient(gradient: Gradient(colors: [.yellow, .orange]), startPoint: .topLeading, endPoint: .bottomTrailing)
                )
                .clipShape(Circle())
                .opacity(isDisabled ? 0.5 : 1.0)
        }.disabled(isDisabled)
    }
}

struct CircleSettingsButton_Previews: PreviewProvider {
    static var previews: some View {
        CircleSettingsButton(isDisabled: false)
    }
}
