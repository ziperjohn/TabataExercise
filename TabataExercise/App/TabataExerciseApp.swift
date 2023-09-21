//
//  TabataExerciseApp.swift
//  TabataExercise
//
//  Created by Jan Vaverka on 23.08.2023.
//

import FirebaseAuth
import FirebaseCore
import FirebaseFirestore
import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

@main
struct TabataExerciseApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(UserObservableObject(authService: AuthService(), firestoreService: FirestoreService()))
                .environmentObject(TabataObservableObject())
                .environmentObject(Coordinator())
        }
    }
}
