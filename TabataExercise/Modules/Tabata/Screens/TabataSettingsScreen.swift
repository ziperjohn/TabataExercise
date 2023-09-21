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
        List {
            // MARK: - Times

            Section {
                ListRow(value: state.$tabataObject.tabataSettings.countdown, title: TabataPhase.countdown.rawValue, iconName: "stopwatch", action: state.changeCountdown)
                ListRow(value: state.$tabataObject.tabataSettings.warmup, title: TabataPhase.warmup.rawValue, iconName: "flame", action: state.changeWarmup)
                ListRow(value: state.$tabataObject.tabataSettings.exercise, title: TabataPhase.exercise.rawValue, iconName: "dumbbell", action: state.changeExercise)
                ListRow(value: state.$tabataObject.tabataSettings.rest, title: TabataPhase.rest.rawValue, iconName: "heart", action: state.changeRest)
                ListRow(value: state.$tabataObject.tabataSettings.recovery, title: TabataPhase.recovery.rawValue, iconName: "pause", action: state.changeRecovery)
                ListRow(value: state.$tabataObject.tabataSettings.cooldown, title: TabataPhase.cooldown.rawValue, iconName: "snowflake", action: state.changeCooldown)
            } header: {
                Text("Times")
            } footer: {
                Text("Workout time: \(state.workoutTime.toTimeString())")
            }

            // MARK: - Repeats

            Section("Repeats") {
                ListRow(value: state.$tabataObject.tabataSettings.sets, title: "Sets", convertToTime: false, iconName: "forward.end", action: state.changeSets)
                ListRow(value: state.$tabataObject.tabataSettings.cycles, title: "Cycles", convertToTime: false, iconName: "circle.hexagonpath", action: state.changeCycles)
            }

            // MARK: - Sound effects

            Section {
                ListRowSwitch(value: state.$isSoundEnabled, title: "Enable sound", onChange: state.changeIsSoundEnabled)

            } header: {
                Text("Sound effects")
            } footer: {
                Text("Turn on and off the sound effects")
            }

            ListRowSound(selectedItem: state.$countdownSound, title: TabataPhase.countdown.rawValue, onChange: state.changeCountdownSound)
            ListRowSound(selectedItem: state.$warmupSound, title: TabataPhase.warmup.rawValue, onChange: state.changeWarmupSound)
            ListRowSound(selectedItem: state.$exerciseSound, title: TabataPhase.exercise.rawValue, onChange: state.changeExerciseSound)
            ListRowSound(selectedItem: state.$restSound, title: TabataPhase.rest.rawValue, onChange: state.changeRestSound)
            ListRowSound(selectedItem: state.$recoverySound, title: TabataPhase.recovery.rawValue, onChange: state.changeRecoverySound)
            ListRowSound(selectedItem: state.$cooldownSound, title: TabataPhase.cooldown.rawValue, onChange: state.changeCooldownSound)
            ListRowSound(selectedItem: state.$finishSound, title: TabataPhase.finished.rawValue, onChange: state.changefinishSound)
        }
        .sheet(isPresented: state.$timeSheetIsShowed, onDismiss: state.onTimeSheetDismiss) {
            TimeSheet(title: state.$sheetTitle, minutes: state.$time.minutes, seconds: state.$time.seconds, isCountdown: state.$isCountdown)
        }
        .sheet(isPresented: state.$repeatsSheetIsShowed, onDismiss: state.onRepeatsSheetDismiss) {
            RepeatsSheet(title: state.$sheetTitle, repeats: state.$repeats)
        }
        .onAppear {
            state.initSounds()
        }
        .navigationTitle("Settings")
        .navigationBarTitleDisplayMode(.large)
        .tint(.orange)
    }
}

struct TabataSettingsScreen_Previews: PreviewProvider {
    static var previews: some View {
        TabataSettingsScreen()
            .environmentObject(TabataObservableObject())
    }
}
