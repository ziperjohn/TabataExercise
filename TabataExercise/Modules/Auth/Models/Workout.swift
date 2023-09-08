//
//  Workout.swift
//  TabataExercise
//
//  Created by Jan Vaverka on 07.09.2023.
//

import Foundation

struct Workout: Identifiable, Codable {
    var id = UUID()
    let workoutTime: Int
    let exercise: Int
    let rest: Int
    let sets: Int
    let cycles: Int
    let date: Date
    let intensity: String
}
