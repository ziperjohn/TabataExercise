//
//  ListRowSwitch.swift
//  TabataExercise
//
//  Created by Jan Vaverka on 04.09.2023.
//

import SwiftUI

struct ListRowSwitch: View {
    @Binding var value: Bool
    let title: String
    let onChange: () -> Void

    var body: some View {
        HStack(spacing: 20) {
            Text("\(title)")

            Spacer()

            Toggle("", isOn: $value)
                .toggleStyle(SwitchToggleStyle(tint: .orange))
        }
        .frame(height: 40)
        .onChange(of: value) { _ in
            onChange()
        }
    }
}

struct ListRowSwitch_Previews: PreviewProvider {
    static var previews: some View {
        ListRowSwitch(value: .constant(true), title: "Enable sounds", onChange: { print("Changed") })
    }
}
