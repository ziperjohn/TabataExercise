//
//  StatisticsText.swift
//  TabataExercise
//
//  Created by Jan Vaverka on 03.09.2023.
//

import SwiftUI

struct StatisticsText: View {
    let value: String
    let label: String

    var body: some View {
        VStack(alignment: .leading) {
            Text(value)
                .font(.system(size: 35, weight: .bold))
                .foregroundStyle(mainLinearGradient)
            Text(label)
                .foregroundColor(.secondary)
        }
    }
}

struct StatisticsText_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsText(value: "01:20", label: "Exercise")
    }
}
