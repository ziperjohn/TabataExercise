//
//  SoundsScreen.swift
//  TabataExercise
//
//  Created by Jan Vaverka on 04.09.2023.
//

import SwiftUI

struct SoundsScreen: View {
    let title: SoundEffect
    @Binding var selectedItem: SoundEffect

    var body: some View {
        List {
            // MARK: - Sounds section

            Section("Select a sound") {
                ListRowSelection(title: SoundEffect.airhorn, selectedItem: $selectedItem)
                ListRowSelection(title: SoundEffect.trippleAirhorn, selectedItem: $selectedItem)
                ListRowSelection(title: SoundEffect.beep, selectedItem: $selectedItem)
                ListRowSelection(title: SoundEffect.gooo, selectedItem: $selectedItem)
                ListRowSelection(title: SoundEffect.relax, selectedItem: $selectedItem)
                ListRowSelection(title: SoundEffect.boxingBell, selectedItem: $selectedItem)
                ListRowSelection(title: SoundEffect.fanfare, selectedItem: $selectedItem)
                ListRowSelection(title: SoundEffect.nextLevel, selectedItem: $selectedItem)
                ListRowSelection(title: SoundEffect.tada, selectedItem: $selectedItem)
                ListRowSelection(title: SoundEffect.yay, selectedItem: $selectedItem)
            }
        }
        .navigationTitle("Sounds")
        .navigationBarTitleDisplayMode(.large)
        .tint(.orange)
    }
}

struct SoundsScreen_Previews: PreviewProvider {
    static var previews: some View {
        SoundsScreen(title: .airhorn, selectedItem: .constant(.airhorn))
    }
}
