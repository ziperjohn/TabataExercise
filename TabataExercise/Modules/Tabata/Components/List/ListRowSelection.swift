//
//  ListRowSelection.swift
//  TabataExercise
//
//  Created by Jan Vaverka on 04.09.2023.
//

import SwiftUI

struct ListRowSelection: View {
    let title: SoundEffect
    @Binding var selectedItem: SoundEffect

    var body: some View {
        HStack {
            Text(title.rawValue)

            Spacer()

            if title == selectedItem {
                Image(systemName: "checkmark")
                    .imageScale(.medium)
                    .foregroundColor(.orange)
            }
        }
        .frame(height: 40)
        .contentShape(Rectangle())
        .onTapGesture {
            selectedItem = title
            SoundService.shared.playSound(title)
        }
    }
}

struct ListRowSelection_Previews: PreviewProvider {
    static var previews: some View {
        ListRowSelection(title: SoundEffect.airhorn, selectedItem: .constant(.airhorn))
    }
}
