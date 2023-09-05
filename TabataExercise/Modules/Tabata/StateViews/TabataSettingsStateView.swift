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

    // MARK: - Variables

    var tabataModel: TabataModel {
        tabataObject.tabataModel
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
            tabataObject.tabataModel.sets = repeats
        } else if sheetTitle == "Cycles" {
            tabataObject.tabataModel.cycles = repeats
        }
    }

    func onTimeSheetDismiss() {
        switch TabataPhase(rawValue: sheetTitle) {
            case .notStarted: break
            case .countdown: tabataObject.tabataModel.countdown = tuplesToSeconds()
            case .warmup: tabataObject.tabataModel.warmup = tuplesToSeconds()
            case .exercise: tabataObject.tabataModel.exercise = tuplesToSeconds()
            case .rest: tabataObject.tabataModel.rest = tuplesToSeconds()
            case .recovery: tabataObject.tabataModel.recovery = tuplesToSeconds()
            case .cooldown: tabataObject.tabataModel.cooldown = tuplesToSeconds()
            case .finished: break
            case .none: break
        }
    }

    func changeCountdown() {
        time = secondsToTuples(seconds: tabataModel.countdown)
        sheetTitle = TabataPhase.countdown.rawValue
        timeSheetIsShowed.toggle()
    }

    func changeWarmup() {
        time = secondsToTuples(seconds: tabataModel.warmup)
        sheetTitle = TabataPhase.warmup.rawValue
        timeSheetIsShowed.toggle()
    }

    func changeExercise() {
        time = secondsToTuples(seconds: tabataModel.exercise)
        sheetTitle = TabataPhase.exercise.rawValue
        timeSheetIsShowed.toggle()
    }

    func changeRest() {
        time = secondsToTuples(seconds: tabataModel.rest)
        sheetTitle = TabataPhase.rest.rawValue
        timeSheetIsShowed.toggle()
    }

    func changeRecovery() {
        time = secondsToTuples(seconds: tabataModel.recovery)
        sheetTitle = TabataPhase.recovery.rawValue
        timeSheetIsShowed.toggle()
    }

    func changeCooldown() {
        time = secondsToTuples(seconds: tabataModel.cooldown)
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
        tabataObject.tabataModel.countdownSound = countdownSound
    }

    func changeWarmupSound() {
        tabataObject.tabataModel.warmupSound = warmupSound
    }

    func changeExerciseSound() {
        tabataObject.tabataModel.exerciseSound = exerciseSound
    }

    func changeRestSound() {
        tabataObject.tabataModel.restSound = restSound
    }

    func changeRecoverySound() {
        tabataObject.tabataModel.recoverySound = recoverySound
    }

    func changeCooldownSound() {
        tabataObject.tabataModel.cooldownSound = cooldownSound
    }

    func changefinishSound() {
        tabataObject.tabataModel.finishSound = finishSound
    }

    func changeIsSoundEnabled() {
        tabataObject.tabataModel.isSoundEnabled = isSoundEnabled
    }

    private func secondsToTuples(seconds: Int) -> (Int, Int) {
        return ((seconds % 3600) / 60, (seconds % 3600) % 60)
    }

    private func tuplesToSeconds() -> Int {
        return (time.minutes * 60) + time.seconds
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
