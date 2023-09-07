//
//  ProfileInfoCard.swift
//  TabataExercise
//
//  Created by Jan Vaverka on 07.09.2023.
//

import SwiftUI

struct ProfileInfoCard: View {
    let initial: String
    let nickname: String
    let email: String

    var body: some View {
        HStack {
            Text(initial)
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .frame(width: 72, height: 72)
                .background(
                    LinearGradient(gradient: Gradient(colors: [.yellow, .orange]), startPoint: .topLeading, endPoint: .bottomTrailing)
                )
                .clipShape(Circle())

            VStack(alignment: .leading, spacing: 4) {
                Text(nickname)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.top, 4)

                Text(email)
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
        }
    }
}

struct ProfileInfoCard_Previews: PreviewProvider {
    static var previews: some View {
        ProfileInfoCard(initial: "Z", nickname: "Ziper", email: "ziper@gmail.com")
    }
}
