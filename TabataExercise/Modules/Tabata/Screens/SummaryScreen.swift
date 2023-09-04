//
//  FinishedScreen.swift
//  TabataExercise
//
//  Created by Jan Vaverka on 03.09.2023.
//

import SwiftUI

struct SummaryScreen: View {
    let state = SummaryStateView()

    var body: some View {
        VStack(alignment: .leading, spacing: 40) {
            // MARK: - Summary title with date

            SummaryTitle(date: state.formatedDate)

            // MARK: - Cheer title

            Text("Another challenge crushed! 💪")
                .font(.largeTitle)
                .fontWeight(.bold)

            // MARK: - Statistics grid

            StatisticsGrid(workoutTime: state.workoutTime, exercise: state.tabataModel.exercise, rest: state.tabataModel.exercise, sets: state.tabataModel.sets, cycles: state.tabataModel.cycles)

            // MARK: - Intensity

            IntensityRow(intensity: state.intensity, action: state.showIntensitySheet)

            Spacer()
        }
        .padding()
        .sheet(isPresented: state.$intensitySheetIsShowed) {
            IntensityScreen(intensityValue: state.$intensityValue, intensityText: state.intensity)
        }
    }
}

struct SummaryScreen_Previews: PreviewProvider {
    static var previews: some View {
        SummaryScreen()
            .environmentObject(TabataObservableObject())
    }
}
