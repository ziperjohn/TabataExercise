//
//  TabataView.swift
//  TabataExercise
//
//  Created by Jan Vaverka on 25.08.2023.
//

import SwiftUI

struct TabataScreen: View {
    @State var totalProgress = 0.85
    @State var phaseProgress = 0.35
    var body: some View {
        NavigationStack {
            // Sets and cycles progress
            HStack(spacing: 100) {
                ProgressText(label: "Sets", current: "-", total: "-")

                ProgressText(label: "Cycles", current: "-", total: "-")
            }

            Spacer()

            // Circle progress with countdown

            ZStack {
                CircleProgress(progress: $totalProgress, width: 300, height: 300, colors: blueGradient, animationDuration: 1)

                CircleProgress(progress: $phaseProgress, width: 255, height: 255, colors: redGradient, animationDuration: 1)

                VStack(spacing: 10) {
                    Text("Exercise")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .opacity(0.5)

                    Text("11")
                        .font(.system(size: 75, weight: .heavy))
                        .opacity(0.8)

                    Text("34:12")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .opacity(0.5)
                }
            }

            Spacer()

            // Buttons section

            HStack {
                CircleButton(icon: Image(systemName: "stop"), size: 75, action: { print("Stop") })
                CircleButton(icon: Image(systemName: "play"), size: 90, action: { print("Start") })

                NavigationLink(destination: TabataSettingsScreen()) {
                    Image(systemName: "gearshape")
                        .font(.title)
                        .foregroundColor(.white)
                        .frame(width: 75, height: 75)
                        .background(
                            LinearGradient(gradient: Gradient(colors: [.yellow, .orange]), startPoint: .topLeading, endPoint: .bottomTrailing)
                        )
                        .clipShape(Circle())
                }
            }

            Spacer()
        }
        .tint(.orange)
    }
}

struct TabataScreen_Previews: PreviewProvider {
    static var previews: some View {
        TabataScreen()
            .environmentObject(TabataObservableObject())
    }
}
