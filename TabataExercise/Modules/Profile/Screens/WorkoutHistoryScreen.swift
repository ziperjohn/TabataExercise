//
//  WorkoutHistory.swift
//  TabataExercise
//
//  Created by Jan Vaverka on 06.09.2023.
//

import SwiftUI

struct WorkoutHistoryScreen: View {
    let workouts: [Workout]

    var body: some View {
        ScrollView {
            // MARK: - Workout history list

            LazyVStack(spacing: 0) {
                ForEach(workouts) { workout in
                    WorkoutCard(date: workout.date.formattedDate(), workoutTime: workout.workoutTime, exercise: workout.exercise, rest: workout.rest, sets: workout.sets, cycles: workout.cycles, intensity: Intensity(rawValue: workout.intensity))
                }
            }
        }
        .background(Color(UIColor.secondarySystemBackground))
        .navigationTitle("History")
        .navigationBarTitleDisplayMode(.large)
        .toolbar(.hidden, for: .tabBar)
    }
}

struct WorkoutHistoryScreen_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutHistoryScreen(workouts: [])
    }
}
