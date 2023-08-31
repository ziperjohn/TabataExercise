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
        tabataModel = TabataModel(countdown: 10, warmup: 10, exercise: 10, rest: 10, recovery: 10, cooldown: 10, sets: 5, cycles: 3)
    }
}
