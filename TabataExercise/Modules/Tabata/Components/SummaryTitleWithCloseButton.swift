//
//  SummaryTitle.swift
//  TabataExercise
//
//  Created by Jan Vaverka on 03.09.2023.
//

import SwiftUI

struct SummaryTitleWithCloseButton: View {
    let date: String
    let action: () -> Void

    var body: some View {
        ZStack(alignment: .leading) {
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

            Button {
                action()
            } label: {
                Image(systemName: "xmark")
                    .frame(width: 40, height: 40)
                    .foregroundColor(.white)
                    .font(.headline)
                    .background(.black.opacity(0.6))
                    .clipShape(Circle())
            }
        }
    }
}

struct SummaryTitle_Previews: PreviewProvider {
    static var previews: some View {
        SummaryTitleWithCloseButton(date: "4.9.2023 15:35", action: { print("click") })
    }
}
