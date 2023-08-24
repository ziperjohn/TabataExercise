//
//  AuthTitle.swift
//  TabataExercise
//
//  Created by Jan Vaverka on 23.08.2023.
//

import SwiftUI

struct AuthTitle: View {
    let title: String
    let subtitle: String

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 7) {
                Text(title)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                Text(subtitle)
                    .font(.headline)
                    .foregroundColor(.secondary)
            }

            Spacer()
        }.padding(.horizontal)
    }
}

struct AuthTitle_Previews: PreviewProvider {
    static var previews: some View {
        AuthTitle(title: "Sign in", subtitle: "Please sign in to continue")
    }
}
