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
        NavigationStack(path: state.$coordinator.stackPath) {
            // MARK: - Sets and cycles progress

            HStack(spacing: 100) {
                ProgressText(label: "Sets",
                             current: "\(state.currentSet)",
                             total: "\(state.tabataModel.sets)",
                             workoutState: state.workoutState)

                ProgressText(label: "Cycles",
                             current: "\(state.currentCycle)",
                             total: "\(state.tabataModel.cycles)",
                             workoutState: state.workoutState)
            }.padding(.top, 20)

            Spacer()

            // MARK: - Progress ring

            ProgressRing(totalProgress: state.$totalProgress,
                         phaseProgress: state.$phaseProgress,
                         currentPhase: state.$tabataPhase,
                         phaseTimeLeft: state.$phaseTimeLeft,
                         exerciseTime: state.$exerciseTime,
                         animationDuration: state.animationDuration)
                .onReceive(timer) { _ in
                    state.track()
                }

            Spacer()

            // MARK: - Buttons section

            HStack {
                CircleButton(icon: "stop",
                             size: 75,
                             isDisabled: state.workoutState != .pause,
                             action: state.openAlertDialog)

                CircleButton(icon: state.mainButtonIcon,
                             size: 90,
                             isDisabled: false,
                             action: state.mainButtonAction)

                CircleButton(icon: "gearshape",
                             size: 75,
                             isDisabled: state.workoutState != .inactive,
                             action: { state.coordinator.stackPath.append(.settings) })
            }
            .navigationDestination(for: Route.self) { _ in
                state.coordinator.tabataSettingsScreen
            }

            Spacer()
        }
        .fullScreenCover(isPresented: state.$summarySheetIsShowed) {
            SummaryScreen()
        }
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
        .toolbar(state.isTabBarShowed, for: .tabBar)
        .onChange(of: state.coordinator.stackPath) { _ in
            state.showTabBar()
        }
    }
}

struct TabataScreen_Previews: PreviewProvider {
    static var previews: some View {
        TabataScreen()
            .environmentObject(TabataObservableObject())
    }
}
