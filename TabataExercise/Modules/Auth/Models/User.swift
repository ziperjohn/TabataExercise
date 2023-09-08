//
//  User.swift
//  TabataExercise
//
//  Created by Jan Vaverka on 24.08.2023.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    let nickname: String
    let email: String
    let workouts: [Workout]

    var initial: String {
        let formater = PersonNameComponentsFormatter()
        if let components = formater.personNameComponents(from: nickname) {
            formater.style = .abbreviated
            return formater.string(from: components)
        }

        return ""
    }
}

extension User {
    static var MOCK_USER = User(id: NSUUID().uuidString, nickname: "Ziper", email: "ziper@gmail.com", workouts: [])
}
