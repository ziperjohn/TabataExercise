//
//  SummaryTitle.swift
//  TabataExercise
//
//  Created by Jan Vaverka on 03.09.2023.
//

import SwiftUI

struct SummaryTitle: View {
    let date: String

    var body: some View {
        HStack {
            Spacer()

            VStack(spacing: 10) {
                Text("Summary")
                    .font(.title2)
                    .fontWeight(.bold)

                Text(date)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }

            Spacer()
        }
    }
}

struct SummaryTitle_Previews: PreviewProvider {
    static var previews: some View {
        SummaryTitle(date: "4.9.2023 15:35")
    }
}
