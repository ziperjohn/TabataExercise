//
//  ListRowProfile.swift
//  TabataExercise
//
//  Created by Jan Vaverka on 06.09.2023.
//

import SwiftUI

struct ListRowProfile: View {
    let title: String
    let icon: String
    let value: String?
    let action: () -> Void

    var body: some View {
        HStack {
            Image(systemName: icon)
                .imageScale(.large)
                .foregroundColor(.orange)
            Text(title)
            Spacer()

            if let value = value {
                Text(value)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
        .frame(height: 40)
        .contentShape(Rectangle())
        .onTapGesture {
            action()
        }
    }
}

struct ListRowProfile_Previews: PreviewProvider {
    static var previews: some View {
        ListRowProfile(title: "App version", icon: "gear", value: "1.0.0", action: { print("Click") })
    }
}
