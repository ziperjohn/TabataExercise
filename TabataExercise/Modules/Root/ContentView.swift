//
//  ContentView.swift
//  TabataExercise
//
//  Created by Jan Vaverka on 23.08.2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var userObject: UserObservableObject
    @EnvironmentObject var coordinator: Coordinator

    var body: some View {
        Group {
            if userObject.userSession != nil {
                TabView {
                    coordinator.tabataScreen
                        .tabItem { Label("Tabata", systemImage: "stopwatch") }

                    coordinator.profileScreen
                        .tabItem { Label("Profile", systemImage: "person.fill") }
                }
                .accentColor(.orange)
            } else {
                coordinator.signInScreen
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserObservableObject(authService: AuthService(), firestoreService: FirestoreService()))
            .environmentObject(Coordinator())
    }
}
