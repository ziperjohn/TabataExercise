//
//  CircleProgress.swift
//  TabataExercise
//
//  Created by Jan Vaverka on 27.08.2023.
//

import SwiftUI

struct ProgressRing: View {
    @Binding var totalProgress: Double
    @Binding var phaseProgress: Double
    @Binding var currentPhase: TabataPhase
    @Binding var phaseTimeLeft: Int
    @Binding var exerciseTime: Int
    let animationDuration: Double

    var body: some View {
        ZStack {
            // MARK: - Outer ring

            ColoredRing(progress: $totalProgress, size: 300, colors: blueGradient, animationDuration: 1.0)

            // MARK: - Outer ring

            ColoredRing(progress: $phaseProgress, size: 253, colors: currentPhase == .exercise ? redGradient : greenGradient, animationDuration: animationDuration)

            // MARK: - Times and current tabata phase

            VStack(spacing: 10) {
                Text(currentPhase.rawValue)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .opacity(0.5)

                Text(phaseTimeLeft.toTimeString())
                    .font(.system(size: 65, weight: .heavy))
                    .opacity(0.8)

                Text(exerciseTime.toTimeString())
                    .font(.title2)
                    .fontWeight(.semibold)
                    .opacity(0.5)
            }
        }
    }
}

struct ProgressRing_Previews: PreviewProvider {
    static var previews: some View {
        ProgressRing(totalProgress: .constant(0.4), phaseProgress: .constant(0.5), currentPhase: .constant(.exercise), phaseTimeLeft: .constant(0), exerciseTime: .constant(0), animationDuration: 1.0)
    }
}
