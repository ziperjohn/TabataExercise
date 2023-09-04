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
    
    var tabataModel: TabataModel {
        tabataObject.tabataModel
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
        tabataPhase = .warmup
        currentSet = 1
        currentCycle = 1
        phaseTimeLeft = tabataModel.warmup
        currentPhaseTime = tabataModel.warmup
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
    
    func track() {
        guard workoutState == .active else { return }
        guard totalProgress < 1.0 else {
            summarySheetIsShowed = true
            workoutState = .inactive
            resetVariables()
            return
        }
        
        animationDuration = 1.0
        totalProgress += totalProgressIncrementPart
        phaseProgress += phaseProgressIncrementPart
        exerciseTime += 1
        phaseTimeLeft -= 1
        
        if phaseTimeLeft <= 0 {
            switchTabataPhase()
        }
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
    
    private func switchTabataPhase() {
        switch tabataPhase {
        case .notStarted: setNewPhaseValues(newPhase: .warmup, phaseTime: tabataModel.warmup)
        case .countdown: break
        case .warmup: setNewPhaseValues(newPhase: .exercise, phaseTime: tabataModel.exercise)
        case .exercise: setNewPhaseValues(newPhase: .rest, phaseTime: tabataModel.rest)
        case .rest:
            if currentSet < tabataModel.sets {
                setNewPhaseValues(newPhase: .exercise, phaseTime: tabataModel.exercise)
                currentSet += 1
            } else if currentCycle <= tabataModel.cycles {
                setNewPhaseValues(newPhase: .recovery, phaseTime: tabataModel.recovery)
            }
        case .recovery:
            if currentCycle == tabataModel.cycles {
                setNewPhaseValues(newPhase: .cooldown, phaseTime: tabataModel.cooldown)
            } else {
                setNewPhaseValues(newPhase: .exercise, phaseTime: tabataModel.exercise)
                currentCycle += 1
                currentSet = 1
            }
        case .cooldown: tabataPhase = .finished
        case .finished: break
        }
    }
    
    private func setNewPhaseValues(newPhase: TabataPhase, phaseTime: Int) {
        tabataPhase = newPhase
        currentPhaseTime = phaseTime
        phaseTimeLeft = phaseTime
        animationDuration = 0.0
        phaseProgress = 0.0
    }
}
