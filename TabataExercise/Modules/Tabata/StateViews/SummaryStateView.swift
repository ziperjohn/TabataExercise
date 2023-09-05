//
//  SummaryStateView.swift
//  TabataExercise
//
//  Created by Jan Vaverka on 03.09.2023.
//

import Foundation
import SwiftUI

struct SummaryStateView: DynamicProperty {
    @EnvironmentObject var tabataObject: TabataObservableObject

    @State private(set) var intensitySheetIsShowed: Bool = false
    @State private(set) var intensityValue: Double = 0.0
    @State private(set) var date: Date = .now

    // MARK: - Variables

    var tabataModel: TabataModel {
        tabataObject.tabataModel
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

    var formatedDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d.M.yyyy H:mm"
        return formatter.string(from: date)
    }

    // MARK: - Functions

    func showIntensitySheet() {
        intensitySheetIsShowed.toggle()
    }
}
