//
//  SoundPlayer.swift
//  SoundBall
//
//  Created by koreamango on 2/22/25.
//

import AVFAudio
import UIKit

class SoundPlayer {
    static var shared = SoundPlayer()
    
    var audioPlayers: [String: AVAudioPlayer] = [:] // 여러 개의 사운드 캐싱
    
    func initAudio() {
        let pitchs = ["C3", "D3", "E3", "F3", "G3", "A3", "B3", "C4", "D4", "E4", "F4"]

        pitchs.forEach {
            guard let audioData = NSDataAsset(name: $0)?.data else {
                fatalError("Asset not found")
            }
            
            let player = try! AVAudioPlayer(data: audioData, fileTypeHint: "wav")
            player.prepareToPlay()
            audioPlayers[$0] = player
        }
    }
}
