//
//  ColoredRing.swift
//  TabataExercise
//
//  Created by Jan Vaverka on 01.09.2023.
//

import SwiftUI

struct ColoredRing: View {
    @Binding var progress: Double
    let width: CGFloat
    let height: CGFloat
    let colors: [Color]
    let animationDuration: Double
    var body: some View {
        ZStack {
            // MARK: Ring placeholder

            Circle()
                .stroke(lineWidth: 25)
                .foregroundColor(.gray)
                .opacity(0.1)

            // MARK: Colored ring

            Circle()
                .trim(from: 0, to: progress)
                .stroke(AngularGradient(gradient: Gradient(colors: colors), center: .center), style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                .rotationEffect(Angle(degrees: 270))
                .animation(.linear(duration: animationDuration), value: progress)
        }
        .frame(width: width, height: height)
    }
}

struct ColoredRing_Previews: PreviewProvider {
    static var previews: some View {
        ColoredRing(progress: .constant(1.0), width: 300, height: 300, colors: redGradient, animationDuration: 1.0)
    }
}
