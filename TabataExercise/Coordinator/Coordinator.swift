//
//  Coordinator.swift
//  TabataExercise
//
//  Created by Jan Vaverka on 13.09.2023.
//

import SwiftUI

class Coordinator: ObservableObject {
    @Published var stackPath: [Route] = []
    
    var signInScreen: some View {
        SignInScreen()
    }
    
    var tabataScreen: some View {
        TabataScreen()
    }
    
    var profileScreen: some View {
        ProfileScreen()
    }
    
    var tabataSettingsScreen: some View {
        TabataSettingsScreen()
    }
    
    func workoutHistoryScreen(wokrouts: [Workout]) -> some View {
        WorkoutHistoryScreen(workouts: wokrouts)
    }
}
