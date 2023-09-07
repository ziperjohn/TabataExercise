//
//  WorkoutHistory.swift
//  TabataExercise
//
//  Created by Jan Vaverka on 06.09.2023.
//

import SwiftUI

struct WorkoutHistoryScreen: View {
    var body: some View {
        ScrollView {
            // MARK: - Workout history list

            LazyVStack(spacing: 0) {
                WorkoutCard(date: "22.4.2022", workoutTime: 2000, exercise: 45, rest: 10, sets: 3, cycles: 8, intensity: .challenging)
                WorkoutCard(date: "22.4.2022", workoutTime: 2000, exercise: 45, rest: 10, sets: 3, cycles: 8, intensity: nil)
                WorkoutCard(date: "22.4.2022", workoutTime: 2000, exercise: 45, rest: 10, sets: 3, cycles: 8, intensity: .challenging)
                WorkoutCard(date: "22.4.2022", workoutTime: 2000, exercise: 45, rest: 10, sets: 3, cycles: 8, intensity: nil)
                WorkoutCard(date: "22.4.2022", workoutTime: 2000, exercise: 45, rest: 10, sets: 3, cycles: 8, intensity: .challenging)
                WorkoutCard(date: "22.4.2022", workoutTime: 2000, exercise: 45, rest: 10, sets: 3, cycles: 8, intensity: nil)
                WorkoutCard(date: "22.4.2022", workoutTime: 2000, exercise: 45, rest: 10, sets: 3, cycles: 8, intensity: .challenging)
                WorkoutCard(date: "22.4.2022", workoutTime: 2000, exercise: 45, rest: 10, sets: 3, cycles: 8, intensity: nil)
            }
        }
        .background(Color(UIColor.secondarySystemBackground))
        .navigationTitle("History")
        .navigationBarTitleDisplayMode(.large)
    }
}

struct WorkoutHistoryScreen_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutHistoryScreen()
    }
}
