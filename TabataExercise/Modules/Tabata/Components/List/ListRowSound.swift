//
//  ListRowSound.swift
//  TabataExercise
//
//  Created by Jan Vaverka on 04.09.2023.
//

import SwiftUI

struct ListRowSound: View {
    @Binding var selectedItem: SoundEffect
    let title: String
    let onChange: () -> Void

    var body: some View {
        NavigationLink(destination: SoundsScreen(title: selectedItem, selectedItem: $selectedItem)) {
            HStack {
                Text(title)

                Spacer()

                Text(selectedItem.rawValue)
                    .font(.subheadline)

            }.frame(height: 40)
        }.onChange(of: selectedItem) { _ in
            onChange()
        }
    }
}

struct ListRowSound_Previews: PreviewProvider {
    static var previews: some View {
        ListRowSound(selectedItem: .constant(.airhorn), title: "Countdown", onChange: { print("Change") })
    }
}
