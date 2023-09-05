//
//  TabataSettingsScreen.swift
//  TabataExercise
//
//  Created by Jan Vaverka on 25.08.2023.
//

import SwiftUI

struct TabataSettingsScreen: View {
    let state = TabataSettingsStateView()

    var body: some View {
        NavigationStack {
            List {
                // MARK: - Times

                Section {
                    ListRow(value: state.$tabataObject.tabataModel.countdown, title: TabataPhase.countdown.rawValue, action: state.changeCountdown, iconName: "stopwatch")
                    ListRow(value: state.$tabataObject.tabataModel.warmup, title: TabataPhase.warmup.rawValue, action: state.changeWarmup, iconName: "flame")
                    ListRow(value: state.$tabataObject.tabataModel.exercise, title: TabataPhase.exercise.rawValue, action: state.changeExercise, iconName: "dumbbell")
                    ListRow(value: state.$tabataObject.tabataModel.rest, title: TabataPhase.rest.rawValue, action: state.changeRest, iconName: "heart")
                    ListRow(value: state.$tabataObject.tabataModel.recovery, title: TabataPhase.recovery.rawValue, action: state.changeRecovery, iconName: "pause")
                    ListRow(value: state.$tabataObject.tabataModel.cooldown, title: TabataPhase.cooldown.rawValue, action: state.changeCooldown, iconName: "snowflake")
                } header: {
                    Text("Times")
                } footer: {
                    Text("Workout time: \(state.workoutTime.toTimeString())")
                }

                // MARK: - Repeats

                Section("Repeats") {
                    ListRow(value: state.$tabataObject.tabataModel.sets, title: "Sets", action: state.changeSets, iconName: "forward.end", convertToTime: false)
                    ListRow(value: state.$tabataObject.tabataModel.cycles, title: "Cycles", action: state.changeCycles, iconName: "circle.hexagonpath", convertToTime: false)
                }

                // MARK: - Sound effects

                Section {
                    ListRowSwitch(value: state.$isSoundEnabled, title: "Enable sound", onChange: state.changeIsSoundEnabled)

                } header: {
                    Text("Sound effects")
                } footer: {
                    Text("On and off the sound effects application")
                }

                if state.isSoundEnabled {
                    ListRowSound(selectedItem: state.$countdownSound, title: TabataPhase.countdown.rawValue, onChange: state.changeCountdownSound)
                    ListRowSound(selectedItem: state.$warmupSound, title: TabataPhase.warmup.rawValue, onChange: state.changeWarmupSound)
                    ListRowSound(selectedItem: state.$exerciseSound, title: TabataPhase.exercise.rawValue, onChange: state.changeExerciseSound)
                    ListRowSound(selectedItem: state.$restSound, title: TabataPhase.rest.rawValue, onChange: state.changeRestSound)
                    ListRowSound(selectedItem: state.$recoverySound, title: TabataPhase.recovery.rawValue, onChange: state.changeRecovery)
                    ListRowSound(selectedItem: state.$cooldownSound, title: TabataPhase.cooldown.rawValue, onChange: state.changeCooldownSound)
                    ListRowSound(selectedItem: state.$finishSound, title: TabataPhase.finished.rawValue, onChange: state.changefinishSound)
                }
            }
        }
        .navigationTitle("Settings")
        .navigationBarTitleDisplayMode(.large)
        .tint(.orange)
        .onAppear {
            state.initSounds()
        }
        .sheet(isPresented: state.$timeSheetIsShowed, onDismiss: state.onTimeSheetDismiss) {
            TimeSheet(title: state.$sheetTitle, minutes: state.$time.minutes, seconds: state.$time.seconds)
        }
        .sheet(isPresented: state.$repeatsSheetIsShowed, onDismiss: state.onRepeatsSheetDismiss) {
            RepeatsSheet(title: state.$sheetTitle, repeats: state.$repeats)
        }
    }
}

struct TabataSettingsScreen_Previews: PreviewProvider {
    static var previews: some View {
        TabataSettingsScreen()
            .environmentObject(TabataObservableObject())
    }
}
