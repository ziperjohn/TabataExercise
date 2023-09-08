//
//  SpinnerSelection.swift
//  TabataExercise
//
//  Created by Jan Vaverka on 28.08.2023.
//

import SwiftUI

struct TimeSpinnerSelection: View {
    @Binding var minutes: Int
    @Binding var seconds: Int

    var body: some View {
        HStack {
            Picker(selection: $minutes, label: Text("Minutes")) {
                ForEach(0 ..< 60) { minute in
                    Text("\(minute) min")
                        .tag(minute)
                }
            }
            .frame(width: 150)
            .clipped()
            .pickerStyle(WheelPickerStyle())

            Picker(selection: $seconds, label: Text("Seconds")) {
                ForEach(0 ..< 60) { second in
                    Text("\(second) sec")
                        .tag(second)
                }
            }
            .frame(width: 150)
            .clipped()
            .pickerStyle(WheelPickerStyle())
        }
        .padding()
    }
}

struct TimeSpinnerSelection_Previews: PreviewProvider {
    static var previews: some View {
        TimeSpinnerSelection(minutes: .constant(0), seconds: .constant(30))
    }
}
