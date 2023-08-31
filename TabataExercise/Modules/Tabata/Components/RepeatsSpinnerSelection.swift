//
//  SpinnerSelection.swift
//  TabataExercise
//
//  Created by Jan Vaverka on 29.08.2023.
//

import SwiftUI

struct RepeatsSpinnerSelection: View {
    @Binding var repeats: Int

    var body: some View {
        HStack {
            Picker(selection: $repeats, label: Text("Repeats")) {
                ForEach(0 ..< 61) { repeats in
                    Text("\(repeats)")
                        .tag(repeats)
                }
            }
            .frame(width: 200)
            .clipped()
            .pickerStyle(WheelPickerStyle())
        }
        .padding()
    }
}

struct RepeatsSpinnerSelection_Previews: PreviewProvider {
    static var previews: some View {
        RepeatsSpinnerSelection(repeats: .constant(4))
    }
}
