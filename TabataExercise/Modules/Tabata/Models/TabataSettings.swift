//
//  TabataModel.swift
//  TabataExercise
//
//  Created by Jan Vaverka on 30.08.2023.
//

import Foundation

struct TabataSettings: Codable {
    var countdown: Int
    var warmup: Int
    var exercise: Int
    var rest: Int
    var recovery: Int
    var cooldown: Int
    var sets: Int
    var cycles: Int
    var isSoundEnabled: Bool
    var countdownSound: SoundEffect
    var warmupSound: SoundEffect
    var exerciseSound: SoundEffect
    var restSound: SoundEffect
    var recoverySound: SoundEffect
    var cooldownSound: SoundEffect
    var finishSound: SoundEffect
}
