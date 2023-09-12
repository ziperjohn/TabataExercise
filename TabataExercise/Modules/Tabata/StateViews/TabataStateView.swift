//
//  TabataStateView.swift
//  TabataExercise
//
//  Created by Jan Vaverka on 31.08.2023.
//

import Foundation
import SwiftUI

struct TabataStateView: DynamicProperty {
    @EnvironmentObject var tabataObject: TabataObservableObject

    @State private(set) var alertDialogIsShowed: Bool = false
    @State private(set) var summarySheetIsShowed: Bool = false
    @State private(set) var workoutState: WorkoutState = .inactive
    @State private(set) var tabataPhase: TabataPhase = .notStarted
    @State private(set) var phaseTimeLeft: Int = 0
    @State private(set) var exerciseTime: Int = 0
    @State private(set) var currentSet: Int = 0
    @State private(set) var currentCycle: Int = 0
    @State private(set) var currentPhaseTime: Int = 0
    @State private(set) var totalProgress: Double = 0.0
    @State private(set) var phaseProgress: Double = 0.0
    @State private(set) var animationDuration: Double = 1.0
    
    // MARK: - Variables
    
    var tabataModel: TabataSettings {
        tabataObject.tabataSettings
    }
    
    var workoutTime: Int {
        tabataObject.workoutTime - 1
    }
    
    var totalProgressIncrementPart: Double {
        1.0 / Double(workoutTime)
    }
    
    var phaseProgressIncrementPart: Double {
        let part = 1.0 / Double(currentPhaseTime)
        let subPart = part / Double(currentPhaseTime)
        
        return part + subPart + (subPart / 2)
    }
    
    var mainButtonIcon: String {
        switch workoutState {
        case .active: return "pause"
        case .inactive: return "play"
        case .pause: return "play"
        }
    }
    
    // MARK: - Functions
    
    func startExercise() {
        Log.info("START")
        workoutState = .active
        tabataPhase = .countdown
        currentSet = 1
        currentCycle = 1
        phaseTimeLeft = tabataModel.countdown
        currentPhaseTime = tabataModel.countdown
    }
    
    func resumeExercise() {
        Log.info("RESUME")
        workoutState = .active
    }
    
    func pauseExercise() {
        Log.info("PAUSE")
        workoutState = .pause
    }
    
    func stopExercise() {
        Log.info("STOP")
        workoutState = .inactive
        resetVariables()
    }
    
    func openAlertDialog() {
        alertDialogIsShowed.toggle()
    }
    
    func track() {
        guard workoutState == .active else { return }
        guard totalProgress < 1.0 else {
            playSound(sound: tabataModel.finishSound)
            summarySheetIsShowed = true
            workoutState = .inactive
            resetVariables()
            return
        }
        
        if tabataPhase == .countdown {
            playSound(sound: tabataModel.countdownSound)
        } else if phaseTimeLeft <= 4 {
            playSound(sound: .tick)
        }
        
        animationDuration = 1.0
        phaseProgress += phaseProgressIncrementPart
        phaseTimeLeft -= 1
        
        if tabataPhase != .countdown {
            totalProgress += totalProgressIncrementPart
            exerciseTime += 1
        }
        
        if phaseTimeLeft <= 0 {
            switchTabataPhase()
        }
    }
    
    private func switchTabataPhase() {
        switch tabataPhase {
        case .notStarted: setNewPhaseValues(newPhase: .countdown, phaseTime: tabataModel.countdown, sound: tabataModel.countdownSound)
        case .countdown: moveFromCountdownTo()
        case .warmup: setNewPhaseValues(newPhase: .exercise, phaseTime: tabataModel.exercise, sound: tabataModel.exerciseSound)
        case .exercise: setNewPhaseValues(newPhase: .rest, phaseTime: tabataModel.rest, sound: tabataModel.restSound)
        case .rest: moveFromRestTo()
        case .recovery: moveFromRecoveryTo()
        case .cooldown: tabataPhase = .finished
        case .finished: break
        }
    }
    
    private func moveFromRestTo() {
        if currentSet < tabataModel.sets {
            setNewPhaseValues(newPhase: .exercise, phaseTime: tabataModel.exercise, sound: tabataModel.exerciseSound)
            currentSet += 1
        } else if currentCycle <= tabataModel.cycles {
            if tabataModel.recovery == 0 && tabataModel.cooldown == 0 {
                tabataPhase = .finished
            } else if tabataModel.recovery == 0 {
                setNewPhaseValues(newPhase: .cooldown, phaseTime: tabataModel.cooldown, sound: tabataModel.cooldownSound)
            } else {
                setNewPhaseValues(newPhase: .recovery, phaseTime: tabataModel.recovery, sound: tabataModel.recoverySound)
            }
        }
    }
    
    private func moveFromRecoveryTo() {
        if currentCycle == tabataModel.cycles {
            if tabataModel.cooldown == 0 {
                tabataPhase = .finished
            } else {
                setNewPhaseValues(newPhase: .cooldown, phaseTime: tabataModel.cooldown, sound: tabataModel.cooldownSound)
            }
        } else {
            setNewPhaseValues(newPhase: .exercise, phaseTime: tabataModel.exercise, sound: tabataModel.exerciseSound)
            currentCycle += 1
            currentSet = 1
        }
    }
    
    private func moveFromCountdownTo() {
        if tabataModel.warmup == 0 {
            setNewPhaseValues(newPhase: .exercise, phaseTime: tabataModel.exercise, sound: tabataModel.exerciseSound)
        } else {
            setNewPhaseValues(newPhase: .warmup, phaseTime: tabataModel.warmup, sound: tabataModel.warmupSound)
        }
    }
    
    private func setNewPhaseValues(newPhase: TabataPhase, phaseTime: Int, sound: SoundEffect) {
        playSound(sound: sound)
        tabataPhase = newPhase
        currentPhaseTime = phaseTime
        phaseTimeLeft = phaseTime
        animationDuration = 0.0
        phaseProgress = 0.0
    }
    
    private func playSound(sound: SoundEffect) {
        guard tabataModel.isSoundEnabled else { return }
        
        SoundService.shared.playSound(sound)
    }
    
    private func resetVariables() {
        tabataPhase = .notStarted
        phaseTimeLeft = 0
        exerciseTime = 0
        totalProgress = 0.0
        phaseProgress = 0.0
        currentSet = 0
        currentCycle = 0
    }
}
