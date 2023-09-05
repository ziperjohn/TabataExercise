//
//  HapticService.swift
//  TabataExercise
//
//  Created by Jan Vaverka on 04.09.2023.
//

import UIKit

class HapticService {
    static let shared = HapticService()

    func playHaptic(_ feedbackStyle: UIImpactFeedbackGenerator.FeedbackStyle) {
        UIImpactFeedbackGenerator(style: feedbackStyle).impactOccurred()
    }
}
