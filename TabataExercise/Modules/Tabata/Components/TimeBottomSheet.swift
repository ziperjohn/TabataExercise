//
//  BottomSheet.swift
//  TabataExercise
//
//  Created by Jan Vaverka on 29.08.2023.
//

import SwiftUI

struct TimeSheet: View {
    @Binding var title: String
    @Binding var minutes: Int
    @Binding var seconds: Int

    var body: some View {
        VStack(spacing: 5) {
            Image(systemName: "chevron.compact.down")
                .foregroundColor(.secondary)
                .font(.title)

            Text("\(title)")
                .font(.title2)
                .fontWeight(.semibold)

            Divider()

            TimeSpinnerSelection(minutes: $minutes, seconds: $seconds)
        }
        .padding(.vertical)
        .presentationDetents([.fraction(0.4)])
    }
}

struct TimeSheet_Previews: PreviewProvider {
    static var previews: some View {
        TimeSheet(title: .constant("Exercise"), minutes: .constant(1), seconds: .constant(10))
    }
}
