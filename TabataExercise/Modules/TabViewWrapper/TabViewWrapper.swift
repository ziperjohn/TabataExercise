//
//  TabWrapper.swift
//  TabataExercise
//
//  Created by Jan Vaverka on 25.08.2023.
//

import SwiftUI

struct TabViewWrapper: View {
    var body: some View {
        TabView {
            TabataScreen()
                .tabItem { Label("Tabata", systemImage: "figure.highintensity.intervaltraining") }

            ProfileScreen()
                .tabItem { Label("Profile", systemImage: "person.fill") }
        }
        .accentColor(.orange)
    }
}

struct TabViewWrapper_Previews: PreviewProvider {
    static var previews: some View {
        TabViewWrapper()
    }
}
