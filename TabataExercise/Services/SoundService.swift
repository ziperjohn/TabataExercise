//
//  SoundService.swift
//  TabataExercise
//
//  Created by Jan Vaverka on 04.09.2023.
//

import AVKit
import Foundation

class SoundService {
    static let shared = SoundService()

    private var player: AVAudioPlayer?

    func playSound(_ soundEffect: SoundEffect) {
        guard let url = Bundle.main.url(forResource: "\(soundEffect)", withExtension: ".mp3") else { return }

        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            Log.error("Error playing sound with error: \(error.localizedDescription)")
        }
    }
}
