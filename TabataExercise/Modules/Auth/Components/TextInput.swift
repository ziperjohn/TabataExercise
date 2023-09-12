//
//  TextInput.swift
//  TabataExercise
//
//  Created by Jan Vaverka on 23.08.2023.
//

import SwiftUI

struct TextInput: View {
    @Binding var text: String
    let title: String
    let placeHolder: String
    let icon: String
    var isSecureField = false

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title)
                .foregroundColor(Color(.darkGray))
                .fontWeight(.semibold)
                .font(.footnote)
                .padding(.leading, 20)

            HStack {
                Image(systemName: icon)
                    .font(.headline)

                if isSecureField {
                    SecureField(placeHolder, text: $text)
                        .font(.headline)
                        .accentColor(.yellow)
                } else {
                    TextField(placeHolder, text: $text)
                        .font(.headline)
                        .accentColor(.yellow)
                }
            }
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 25).stroke(.yellow, lineWidth: 2))
        }
        .padding(.horizontal)
    }
}

struct TextInput_Previews: PreviewProvider {
    static var previews: some View {
        TextInput(text: .constant(""), title: "Email", placeHolder: "name@example.com", icon: "envelope")
    }
}
