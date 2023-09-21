//
//  RowStatistics.swift
//  TabataExercise
//
//  Created by Jan Vaverka on 03.09.2023.
//

import SwiftUI

struct StatisticsGrid: View {
    let workoutTime: Int
    let exercise: Int
    let rest: Int
    let sets: Int
    let cycles: Int

    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            VStack(alignment: .leading) {
                Text("\(workoutTime.toTimeString())")
                    .font(.system(size: 70, weight: .heavy))
                    .foregroundStyle(mainLinearGradient)
                Text("Workout time")
                    .foregroundColor(.secondary)
            }

            Grid(alignment: .leading, horizontalSpacing: 60, verticalSpacing: 15) {
                GridRow {
                    StatisticsText(value: "\(exercise.toTimeString())", label: "Exercise")
                    StatisticsText(value: "\(rest.toTimeString())", label: "Rest")
                }
                GridRow {
                    StatisticsText(value: "\(sets)x", label: "Sets")
                    StatisticsText(value: "\(cycles)x", label: "Cycles")
                }
            }
        }
    }
}

struct RowStatistics_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsGrid(workoutTime: 530, exercise: 45, rest: 30, sets: 6, cycles: 8)
    }
}
