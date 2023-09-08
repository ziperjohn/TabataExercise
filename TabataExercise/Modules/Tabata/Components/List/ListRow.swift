//
//  ListRow.swift
//  TabataExercise
//
//  Created by Jan Vaverka on 28.08.2023.
//

import SwiftUI

struct ListRow: View {
    @Binding var value: Int
    let title: String
    let action: () -> Void
    let iconName: String?
    var convertToTime: Bool = true

    var body: some View {
        HStack(spacing: 20) {
            if iconName != nil {
                Image(systemName: iconName!)
                    .imageScale(.large)
                    .foregroundColor(.orange)
                    .frame(width: 30, height: 30)
            }

            Text("\(title)")

            Spacer()

            if convertToTime {
                Text("\(value.asString(style: .short))")
                    .font(.subheadline)
            } else {
                Text("\(value)")
                    .font(.subheadline)
            }

            Image(systemName: "chevron.down")
                .imageScale(.small)
                .foregroundColor(.secondary.opacity(0.7))
        }
        .frame(height: 40)
        .contentShape(Rectangle())
        .onTapGesture {
            action()
        }
    }
}

struct ListRow_Previews: PreviewProvider {
    static var previews: some View {
        ListRow(value: .constant(30), title: "Exercise", action: { print("Exercise") }, iconName: "dumbbell.fill")
    }
}
