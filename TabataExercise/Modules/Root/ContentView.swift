//
//  ContentView.swift
//  TabataExercise
//
//  Created by Jan Vaverka on 23.08.2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authViewState: AuthViewState

    var body: some View {
        Group {
            if authViewState.userSession != nil {
                ProfileScreen()
            } else {
                SignInScreen()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AuthViewState())
    }
}
