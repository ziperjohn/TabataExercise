//
//  AlertMessage.swift
//  TabataExercise
//
//  Created by Jan Vaverka on 26.08.2023.
//

import SwiftUI

struct AlertMessage: View {
    let text: String
    let color: Color

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: "info.circle")
                .foregroundColor(color)
                .imageScale(.large)

            Text(text)
        }
        .padding()
        .background(color.opacity(0.2))
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(color, lineWidth: 2)
        )
        .padding()
    }
}

struct AlertMessage_Previews: PreviewProvider {
    static var previews: some View {
        AlertMessage(text: "Email has been sent, check your email!", color: .green)
    }
}
