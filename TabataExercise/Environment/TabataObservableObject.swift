//
//  TabataObservableObject.swift
//  TabataExercise
//
//  Created by Jan Vaverka on 28.08.2023.
//

import Foundation

class TabataObservableObject: ObservableObject {
    @Published var tabataModel: TabataModel

    init() {
        tabataModel = TabataModel(countdown: 5, warmup: 60, exercise: 10, rest: 10, recovery: 10, cooldown: 10, sets: 5, cycles: 3, isSoundEnabled: true, countdownSound: .beep, warmupSound: .airhorn, exerciseSound: .gooo, restSound: .relax, recoverySound: .relax, cooldownSound: .boxingBell, finishSound: .trippleAirhorn)
    }

    var workoutTime: Int {
        tabataModel.warmup + tabataModel.cooldown + ((tabataModel.exercise + tabataModel.rest) * tabataModel.sets + tabataModel.recovery) * tabataModel.cycles
    }
}
