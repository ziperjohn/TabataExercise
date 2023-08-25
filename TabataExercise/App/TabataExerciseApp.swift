//
//  TabataExerciseApp.swift
//  TabataExercise
//
//  Created by Jan Vaverka on 23.08.2023.
//

import Firebase
import SwiftUI

@main
struct TabataExerciseApp: App {
    @StateObject var authViewState = AuthViewState()

    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(authViewState)
        }
    }
}
