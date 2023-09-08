//
//  SummaryStateView.swift
//  TabataExercise
//
//  Created by Jan Vaverka on 03.09.2023.
//

import Foundation
import SwiftUI

struct SummaryStateView: DynamicProperty {
    @EnvironmentObject var userObject: UserObservableObject
    @EnvironmentObject var tabataObject: TabataObservableObject

    @State private(set) var intensitySheetIsShowed: Bool = false
    @State private(set) var intensityValue: Double = 0.0
    @State private(set) var date: Date = .now

    // MARK: - Variables

    var tabataModel: TabataSettings {
        tabataObject.tabataSettings
    }

    var workoutTime: Int {
        tabataObject.workoutTime
    }

    var intensity: Intensity {
        switch intensityValue {
            case 0: return Intensity.none
            case 1: return Intensity.light
            case 2: return Intensity.easy
            case 3: return Intensity.moderate
            case 4: return Intensity.challenging
            case 5: return Intensity.hard
            default: return Intensity.none
        }
    }

    // MARK: - Functions

    func showIntensitySheet() {
        intensitySheetIsShowed.toggle()
    }

    func summaryClosed() async throws {
        let workout = Workout(workoutTime: workoutTime, exercise: tabataModel.exercise, rest: tabataModel.rest, sets: tabataModel.sets, cycles: tabataModel.cycles, date: date, intensity: intensity.rawValue)

        do {
            try await userObject.addWorkoutToDB(workout: workout)
            try await userObject.getUserFromDB()
        } catch {
            Log.error(error.localizedDescription)
        }
    }
}

extension Date {
    func formattedDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d.M.yyyy H:mm"
        return formatter.string(from: self)
    }
}
