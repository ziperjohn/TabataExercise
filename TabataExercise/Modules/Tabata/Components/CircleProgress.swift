//
//  CircleProgress.swift
//  TabataExercise
//
//  Created by Jan Vaverka on 27.08.2023.
//

import SwiftUI

struct CircleProgress: View {
    @Binding var progress: Double
    let width: CGFloat
    let height: CGFloat
    let colors: [Color]
    let animationDuration: Double

    var body: some View {
        ZStack {
            // Circle placeholder

            Circle()
                .stroke(lineWidth: 25)
                .foregroundColor(.gray)
                .opacity(0.1)

            // Colored circle

            Circle()
                .trim(from: 0, to: min(progress, 1.0))
                .stroke(AngularGradient(gradient: Gradient(colors: colors), center: .center), style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                .rotationEffect(Angle(degrees: 270))
                .animation(.linear(duration: animationDuration), value: progress)
        }
        .frame(width: width, height: height)
//        .padding()
    }
}

struct CircleProgress_Previews: PreviewProvider {
    static var previews: some View {
        CircleProgress(progress: .constant(1.0), width: 300, height: 300, colors: redGradient, animationDuration: 1)
    }
}
