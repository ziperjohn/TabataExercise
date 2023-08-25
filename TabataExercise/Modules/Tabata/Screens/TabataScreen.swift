//
//  TabataView.swift
//  TabataExercise
//
//  Created by Jan Vaverka on 25.08.2023.
//

import SwiftUI

struct TabataScreen: View {
    var body: some View {
        NavigationStack {
            Text("Tabata Screen")

            NavigationLink(destination: TabataSettingsScreen()) {
                Text("Settings")
            }
        }
        .tint(.orange)
    }
}

struct TabataScreen_Previews: PreviewProvider {
    static var previews: some View {
        TabataScreen()
    }
}
