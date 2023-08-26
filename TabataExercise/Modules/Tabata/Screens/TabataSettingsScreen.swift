//
//  TabataSettingsScreen.swift
//  TabataExercise
//
//  Created by Jan Vaverka on 25.08.2023.
//

import SwiftUI

struct TabataSettingsScreen: View {
    var body: some View {
        VStack {
            Text("Tabata settings screen")
        }
        .toolbar(.hidden, for: .tabBar)
    }
}

struct TabataSettingsScreen_Previews: PreviewProvider {
    static var previews: some View {
        TabataSettingsScreen()
    }
}
