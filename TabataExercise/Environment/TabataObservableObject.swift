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
        tabataModel = TabataModel(countdown: 3, warmup: 30, exercise: 20, rest: 10, recovery: 15, cooldown: 30, sets: 3, cycles: 2, isSoundEnabled: true, countdownSound: .beep, warmupSound: .airhorn, exerciseSound: .gooo, restSound: .relax, recoverySound: .tada, cooldownSound: .boxingBell, finishSound: .trippleAirhorn)
    }

    var workoutTime: Int {
        tabataModel.warmup + tabataModel.cooldown + ((tabataModel.exercise + tabataModel.rest) * tabataModel.sets + tabataModel.recovery) * tabataModel.cycles
    }
}
