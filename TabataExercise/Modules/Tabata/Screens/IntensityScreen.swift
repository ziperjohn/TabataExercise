//
//  IntensityScreen.swift
//  TabataExercise
//
//  Created by Jan Vaverka on 03.09.2023.
//

import SwiftUI

struct IntensityScreen: View {
    @Binding var intensityValue: Double
    var intensityText: Intensity

    var body: some View {
        VStack {
            Spacer()

            // MARK: - Title

            Text("How difficult was the workout?")
                .font(.title2)
                .fontWeight(.semibold)

            Spacer()

            // MARK: - Intensity value

            Text("\(Int(intensityValue))")
                .font(.system(size: 75, weight: .heavy))
                .foregroundStyle(LinearGradient(
                    colors: [.yellow, .orange],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                ))

            // MARK: - Intensity text

            Text(intensityText.rawValue)
                .font(.largeTitle)
                .foregroundStyle(LinearGradient(
                    colors: [.yellow, .orange],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                ))

            Spacer()

            // MARK: - Slider

            Slider(
                value: $intensityValue,
                in: 0 ... 5,
                step: 1,
                onEditingChanged: { _ in }
            )

            .accentColor(.orange)

            Spacer()
        }
        .padding()
    }
}

struct IntensityScreen_Previews: PreviewProvider {
    static var previews: some View {
        IntensityScreen(intensityValue: .constant(0.0), intensityText: Intensity.none)
    }
}
