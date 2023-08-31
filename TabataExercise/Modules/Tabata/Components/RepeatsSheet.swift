//
//  RepeatsSheet.swift
//  TabataExercise
//
//  Created by Jan Vaverka on 29.08.2023.
//

import SwiftUI

struct RepeatsSheet: View {
    @Binding var title: String
    @Binding var repeats: Int

    var body: some View {
        VStack(spacing: 5) {
            Image(systemName: "chevron.compact.down")
                .foregroundColor(.secondary)
                .font(.title)

            Text("\(title)")
                .font(.title2)
                .fontWeight(.semibold)

            Divider()

            RepeatsSpinnerSelection(repeats: $repeats)
        }
        .padding(.vertical)
        .presentationDetents([.fraction(0.4)])
    }
}

struct RepeatsSheet_Previews: PreviewProvider {
    static var previews: some View {
        RepeatsSheet(title: .constant("Title"), repeats: .constant(4))
    }
}
