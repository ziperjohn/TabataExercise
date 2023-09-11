//
//  FinishedScreen.swift
//  TabataExercise
//
//  Created by Jan Vaverka on 03.09.2023.
//

import SwiftUI

struct SummaryScreen: View {
    @Environment(\.dismiss) var dismiss

    let state = SummaryStateView()

    var body: some View {
        VStack(alignment: .leading, spacing: 40) {
            // MARK: - Summary title with date

            SummaryTitleWithCloseButton(date: state.date.formattedDate(), action: {
                Task { try await state.summaryClosed() }
                dismiss()
            })

            // MARK: - Cheer title

            Text("Another challenge crushed! 💪")
                .font(.largeTitle)
                .fontWeight(.bold)

            // MARK: - Statistics grid

            StatisticsGrid(workoutTime: state.workoutTime, exercise: state.tabataModel.exercise, rest: state.tabataModel.rest, sets: state.tabataModel.sets, cycles: state.tabataModel.cycles)

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
