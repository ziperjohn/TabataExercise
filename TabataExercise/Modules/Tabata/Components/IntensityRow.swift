//
//  IntensityRow.swift
//  TabataExercise
//
//  Created by Jan Vaverka on 03.09.2023.
//

import SwiftUI

struct IntensityRow: View {
    let intensity: Intensity
    let action: () -> Void
    var body: some View {
        VStack {
            HStack {
                Text("Intensity")
                    .font(.headline)
                Spacer()

                if intensity == .none {
                    Image(systemName: "plus")
                } else {
                    Text(intensity.rawValue)
                }
            }
            .contentShape(Rectangle())
            .onTapGesture {
                action()
            }

            Divider()
        }
    }
}

struct IntensityRow_Previews: PreviewProvider {
    static var previews: some View {
        IntensityRow(intensity: .none, action: { print("Click") })
    }
}
