//
//  TabataSettingsStateView.swift
//  TabataExercise
//
//  Created by Jan Vaverka on 29.08.2023.
//

import SwiftUI

struct TabataSettingsStateView: DynamicProperty {
    @EnvironmentObject var tabataObject: TabataObservableObject

    @State var timeSheetIsShowed = false
    @State var repeatsSheetIsShowed = false
    @State var sheetTitle = ""
    @State var repeats = 1
    @State var time = (minutes: 0, seconds: 30)

    var countdown: Int {
        tabataObject.tabataModel.countdown
    }

    var warmup: Int {
        tabataObject.tabataModel.warmup
    }

    var exercise: Int {
        tabataObject.tabataModel.exercise
    }

    var rest: Int {
        tabataObject.tabataModel.rest
    }

    var recovery: Int {
        tabataObject.tabataModel.recovery
    }

    var cooldown: Int {
        tabataObject.tabataModel.cooldown
    }

    var sets: Int {
        tabataObject.tabataModel.sets
    }

    var cycles: Int {
        tabataObject.tabataModel.cycles
    }

    var totalTime: String {
        let result = countdown + warmup + cooldown + ((exercise + rest) * sets + recovery) * cycles
        return result.asString(style: .short)
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

    func secondsToTuples(seconds: Int) -> (Int, Int) {
        return ((seconds % 3600) / 60, (seconds % 3600) % 60)
    }

    func tuplesToSeconds() -> Int {
        return (time.minutes * 60) + time.seconds
    }

    func changeCountdown() {
        time = secondsToTuples(seconds: countdown)
        sheetTitle = TabataPhase.countdown.rawValue
        timeSheetIsShowed.toggle()
    }

    func changeWarmup() {
        time = secondsToTuples(seconds: warmup)
        sheetTitle = TabataPhase.warmup.rawValue
        timeSheetIsShowed.toggle()
    }

    func changeExercise() {
        time = secondsToTuples(seconds: exercise)
        sheetTitle = TabataPhase.exercise.rawValue
        timeSheetIsShowed.toggle()
    }

    func changeRest() {
        time = secondsToTuples(seconds: rest)
        sheetTitle = TabataPhase.rest.rawValue
        timeSheetIsShowed.toggle()
    }

    func changeRecovery() {
        time = secondsToTuples(seconds: recovery)
        sheetTitle = TabataPhase.recovery.rawValue
        timeSheetIsShowed.toggle()
    }

    func changeCooldown() {
        time = secondsToTuples(seconds: cooldown)
        sheetTitle = TabataPhase.cooldown.rawValue
        timeSheetIsShowed.toggle()
    }

    func changeSets() {
        repeats = sets
        sheetTitle = "Sets"
        repeatsSheetIsShowed.toggle()
    }

    func changeCycles() {
        repeats = cycles
        sheetTitle = "Cycles"
        repeatsSheetIsShowed.toggle()
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
