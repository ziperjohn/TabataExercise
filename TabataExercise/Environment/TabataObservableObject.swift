//
//  TabataObservableObject.swift
//  TabataExercise
//
//  Created by Jan Vaverka on 28.08.2023.
//

import Foundation

class TabataObservableObject: ObservableObject {
    @Published var tabataSettings: TabataSettings {
        didSet {
            saveTabataSettingsToStorage()
        }
    }

    private let userDefaultsKey = "tabataSettings"

    init() {
        if let savedData = UserDefaults.standard.data(forKey: userDefaultsKey),
           let loadedTabataSettings = try? JSONDecoder().decode(TabataSettings.self, from: savedData)
        {
            self.tabataSettings = loadedTabataSettings
        } else {
            self.tabataSettings = TabataSettings(countdown: 3, warmup: 30, exercise: 20, rest: 10, recovery: 15, cooldown: 30, sets: 3, cycles: 2, isSoundEnabled: true, countdownSound: .beep, warmupSound: .airhorn, exerciseSound: .gooo, restSound: .relax, recoverySound: .tada, cooldownSound: .boxingBell, finishSound: .trippleAirhorn)
        }
    }

    var workoutTime: Int {
        tabataSettings.warmup + tabataSettings.cooldown + ((tabataSettings.exercise + tabataSettings.rest) * tabataSettings.sets + tabataSettings.recovery) * tabataSettings.cycles
    }

    func saveTabataSettingsToStorage() {
        if let encoded = try? JSONEncoder().encode(tabataSettings) {
            UserDefaults.standard.set(encoded, forKey: userDefaultsKey)
        }
    }

    func loadTabataSettingsFromStorage() {
        if let savedData = UserDefaults.standard.data(forKey: userDefaultsKey),
           let loadedTabataSettings = try? JSONDecoder().decode(TabataSettings.self, from: savedData)
        {
            tabataSettings = loadedTabataSettings
        }
    }
}
