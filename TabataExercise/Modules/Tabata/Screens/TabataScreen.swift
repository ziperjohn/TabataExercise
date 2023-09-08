//
//  TabataView.swift
//  TabataExercise
//
//  Created by Jan Vaverka on 25.08.2023.
//

import SwiftUI

struct TabataScreen: View {
    let state = TabataStateView()
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        NavigationStack {
            // MARK: - Sets and cycles progress

            HStack(spacing: 100) {
                ProgressText(label: "Sets", current: "\(state.currentSet)", total: "\(state.tabataModel.sets)", workoutState: state.workoutState)

                ProgressText(label: "Cycles", current: "\(state.currentCycle)", total: "\(state.tabataModel.cycles)", workoutState: state.workoutState)
            }.padding(.top, 20)

            Spacer()

            // MARK: - Progress ring

            ProgressRing(totalProgress: state.$totalProgress, phaseProgress: state.$phaseProgress, currentPhase: state.$tabataPhase, phaseTimeLeft: state.$phaseTimeLeft, exerciseTime: state.$exerciseTime, animationDuration: state.animationDuration)
                .onReceive(timer) { _ in
                    state.track()
                }

            Spacer()

            // MARK: - Buttons section

            HStack {
                CircleButton(icon: Image(systemName: "stop"),
                             size: 75,
                             action: { state.openAlertDialog() },
                             isDisabled: state.workoutState != .pause)
                CircleButton(icon: Image(systemName: state.mainButtonIcon),
                             size: 90,
                             action: { state.workoutState == .inactive ? state.startExercise() : state.workoutState == .pause ?
                                 state.resumeExercise() : state.pauseExercise()
                             },
                             isDisabled: false)
                CircleSettingsButton(isDisabled: state.workoutState != .inactive)
            }

            Spacer()
        }
        .fullScreenCover(isPresented: state.$summarySheetIsShowed) {
            SummaryScreen()
        }
//        .sheet(isPresented:  {
//
//        }
        .alert(isPresented: state.$alertDialogIsShowed) {
            Alert(
                title: Text("Are you sure?"),
                message: Text("You are in the middle of a workout, would you like to finish this workout?"),
                primaryButton: .cancel(),
                secondaryButton: .destructive(
                    Text("Yes"),
                    action: state.stopExercise
                )
            )
        }
        .toolbar(state.workoutState == .active ? .hidden : .visible, for: .tabBar)
    }
}

struct TabataScreen_Previews: PreviewProvider {
    static var previews: some View {
        TabataScreen()
            .environmentObject(TabataObservableObject())
    }
}
