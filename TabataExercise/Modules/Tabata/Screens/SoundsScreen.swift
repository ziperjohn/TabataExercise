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
                ForEach(SoundEffect.allCases, id: \.rawValue) { item in
                    ListRowSelection(title: item, selectedItem: $selectedItem)
                }
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
