//
//  ProgressText.swift
//  TabataExercise
//
//  Created by Jan Vaverka on 28.08.2023.
//

import SwiftUI

struct ProgressText: View {
    let label: String
    let current: String
    let total: String

    var body: some View {
        VStack(spacing: 10) {
            Text("\(current) / \(total)")
                .font(.headline)

            Text(label)
                .font(.subheadline)
                .opacity(0.5)
        }
    }
}

struct ProgressText_Previews: PreviewProvider {
    static var previews: some View {
        ProgressText(label: "Sets", current: "-", total: "-")
    }
}
