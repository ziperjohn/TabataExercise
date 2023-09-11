//
//  TabataSettingsStateView.swift
//  TabataExercise
//
//  Created by Jan Vaverka on 29.08.2023.
//

import SwiftUI

struct TabataSettingsStateView: DynamicProperty {
    @EnvironmentObject var tabataObject: TabataObservableObject

    @State private(set) var timeSheetIsShowed = false
    @State private(set) var repeatsSheetIsShowed = false
    @State private(set) var sheetTitle = ""
    @State private(set) var repeats = 1
    @State private(set) var time = (minutes: 0, seconds: 30)
    @State private(set) var isSoundEnabled = true
    @State private(set) var countdownSound: SoundEffect = .beep
    @State private(set) var warmupSound: SoundEffect = .airhorn
    @State private(set) var exerciseSound: SoundEffect = .gooo
    @State private(set) var restSound: SoundEffect = .relax
    @State private(set) var recoverySound: SoundEffect = .relax
    @State private(set) var cooldownSound: SoundEffect = .boxingBell
    @State private(set) var finishSound: SoundEffect = .trippleAirhorn
    @State private(set) var isCountdown: Bool = false

    // MARK: - Variables

    var tabataModel: TabataSettings {
        tabataObject.tabataSettings
    }

    var workoutTime: Int {
        tabataObject.workoutTime
    }

    // MARK: - Functions

    func initSounds() {
        isSoundEnabled = tabataModel.isSoundEnabled
        countdownSound = tabataModel.countdownSound
        warmupSound = tabataModel.warmupSound
        exerciseSound = tabataModel.exerciseSound
        restSound = tabataModel.restSound
        recoverySound = tabataModel.recoverySound
        cooldownSound = tabataModel.cooldownSound
        finishSound = tabataModel.finishSound
    }

    func onRepeatsSheetDismiss() {
        if sheetTitle == "Sets" {
            tabataObject.tabataSettings.sets = repeats
        } else if sheetTitle == "Cycles" {
            tabataObject.tabataSettings.cycles = repeats
        }
    }

    func onTimeSheetDismiss() {
        isCountdown = false

        switch TabataPhase(rawValue: sheetTitle) {
            case .notStarted: break
            case .countdown: tabataObject.tabataSettings.countdown = tupleToSeconds()
            case .warmup: tabataObject.tabataSettings.warmup = tupleToSeconds()
            case .exercise: tabataObject.tabataSettings.exercise = tupleToSeconds(minValueisOne: true)
            case .rest: tabataObject.tabataSettings.rest = tupleToSeconds(minValueisOne: true)
            case .recovery: tabataObject.tabataSettings.recovery = tupleToSeconds()
            case .cooldown: tabataObject.tabataSettings.cooldown = tupleToSeconds()
            case .finished: break
            case .none: break
        }
    }

    func changeCountdown() {
        isCountdown = true
        time = secondsToTuple(seconds: tabataModel.countdown)
        sheetTitle = TabataPhase.countdown.rawValue
        timeSheetIsShowed.toggle()
    }

    func changeWarmup() {
        time = secondsToTuple(seconds: tabataModel.warmup)
        sheetTitle = TabataPhase.warmup.rawValue
        timeSheetIsShowed.toggle()
    }

    func changeExercise() {
        time = secondsToTuple(seconds: tabataModel.exercise)
        sheetTitle = TabataPhase.exercise.rawValue
        timeSheetIsShowed.toggle()
    }

    func changeRest() {
        time = secondsToTuple(seconds: tabataModel.rest)
        sheetTitle = TabataPhase.rest.rawValue
        timeSheetIsShowed.toggle()
    }

    func changeRecovery() {
        time = secondsToTuple(seconds: tabataModel.recovery)
        sheetTitle = TabataPhase.recovery.rawValue
        timeSheetIsShowed.toggle()
    }

    func changeCooldown() {
        time = secondsToTuple(seconds: tabataModel.cooldown)
        sheetTitle = TabataPhase.cooldown.rawValue
        timeSheetIsShowed.toggle()
    }

    func changeSets() {
        repeats = tabataModel.sets
        sheetTitle = "Sets"
        repeatsSheetIsShowed.toggle()
    }

    func changeCycles() {
        repeats = tabataModel.cycles
        sheetTitle = "Cycles"
        repeatsSheetIsShowed.toggle()
    }

    func changeCountdownSound() {
        tabataObject.tabataSettings.countdownSound = countdownSound
    }

    func changeWarmupSound() {
        tabataObject.tabataSettings.warmupSound = warmupSound
    }

    func changeExerciseSound() {
        tabataObject.tabataSettings.exerciseSound = exerciseSound
    }

    func changeRestSound() {
        tabataObject.tabataSettings.restSound = restSound
    }

    func changeRecoverySound() {
        tabataObject.tabataSettings.recoverySound = recoverySound
    }

    func changeCooldownSound() {
        tabataObject.tabataSettings.cooldownSound = cooldownSound
    }

    func changefinishSound() {
        tabataObject.tabataSettings.finishSound = finishSound
    }

    func changeIsSoundEnabled() {
        tabataObject.tabataSettings.isSoundEnabled = isSoundEnabled
    }

    private func secondsToTuple(seconds: Int) -> (Int, Int) {
        return ((seconds % 3600) / 60, (seconds % 3600) % 60)
    }

    private func tupleToSeconds(minValueisOne: Bool = false) -> Int {
        let seconds = (time.minutes * 60) + time.seconds

        if seconds == 0 && minValueisOne {
            return 1
        } else {
            return seconds
        }
    }
}

// MARK: - Int to formated time as string

extension Int {
    func asString(style: DateComponentsFormatter.UnitsStyle) -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.unitsStyle = style
        let formattedString = formatter.string(from: TimeInterval(self))!

        return formattedString
    }
}
