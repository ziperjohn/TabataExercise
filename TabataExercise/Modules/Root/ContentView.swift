//
//  ContentView.swift
//  TabataExercise
//
//  Created by Jan Vaverka on 23.08.2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var userObject: UserObservableObject

    var body: some View {
        Group {
            if userObject.userSession != nil {
                TabView {
                    TabataScreen()
                        .tabItem { Label("Tabata", systemImage: "stopwatch") }

                    ProfileScreen()
                        .tabItem { Label("Profile", systemImage: "person.fill") }
                }
                .accentColor(.orange)
            } else {
                SignInScreen()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserObservableObject(authService: AuthService(), firestoreService: FirestoreService()))
    }
}
