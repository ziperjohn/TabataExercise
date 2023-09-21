//
//  WorkoutCardRow.swift
//  TabataExercise
//
//  Created by Jan Vaverka on 06.09.2023.
//

import SwiftUI

struct WorkoutCard: View {
    let date: String
    let workoutTime: Int
    let exercise: Int
    let rest: Int
    let sets: Int
    let cycles: Int
    let intensity: Intensity?

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Workout time")
                    .font(.footnote)
                    .foregroundColor(.secondary)

                Spacer()

                Text(date)
                    .foregroundColor(.secondary)
            }

            Text("\(workoutTime.toTimeString())")
                .font(.system(size: 50, weight: .heavy))
                .foregroundStyle(mainLinearGradient)

            Grid(alignment: .leading, horizontalSpacing: 35) {
                GridRow {
                    SmallStatisticsText(title: "Exercise", value: "\(exercise.toTimeString())")
                    SmallStatisticsText(title: "Rest", value: "\(rest.toTimeString())")
                    SmallStatisticsText(title: "Sets", value: "\(sets)x")
                    SmallStatisticsText(title: "Cycles", value: "\(cycles)x")
                }
            }

            if let intensity, intensity != .none {
                Divider()

                Text(intensity.rawValue)
                    .font(.headline)
            }
        }
        .padding()
        .background(Color(UIColor.systemBackground))
        .cornerRadius(10)
        .padding(.horizontal)
        .padding(.vertical, 10)
    }
}

struct WorkoutCardRow_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutCard(date: "5.9.2023", workoutTime: 1553, exercise: 50, rest: 15, sets: 6, cycles: 9, intensity: .hard)
    }
}

// MARK: - Small statistics text view

struct SmallStatisticsText: View {
    let title: String
    let value: String

    var body: some View {
        VStack(alignment: .leading) {
            Text(value)
                .font(.headline)
            Text(title)
                .font(.footnote)
                .foregroundColor(.secondary)
        }
    }
}

struct SmallStatisticsText_Previews: PreviewProvider {
    static var previews: some View {
        SmallStatisticsText(title: "Cycles", value: "10x")
    }
}
