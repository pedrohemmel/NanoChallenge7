//
//  AVAudio.swift
//  NanoChallenge7
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 09/02/23.
//

import Foundation
import AVFoundation

final class AVAudio {

    public var soundEffectPlayer: AVAudioPlayer?
    
    public class func sharedInstance() -> AVAudio {
        return AVAudio()
    }

//    public func pauseBackgroundMusic() {
//        if let player = soundEffectPlayer {
//            if player.isPlaying {
//                player.pause()
//            }
//        }
//    }
//
//    public func resumeBackgroundMusic() {
//        if let player = soundEffectPlayer {
//            if !player.isPlaying {
//                player.play()
//            }
//        }
//    }

    public func playSoundEffect(_ filename: String) {
        let url = Bundle.main.url(forResource: filename,
                                  withExtension: nil)
        if (url == nil) {
            print("Could not find file: \(filename)")
            return
        }
        var error: NSError? = nil
        do {
            self.soundEffectPlayer = try AVAudioPlayer(contentsOf: url!)
        } catch let undefinedSoundEffect as NSError {
            error = undefinedSoundEffect
            self.soundEffectPlayer = nil
        }
        if let player = self.soundEffectPlayer {
            player.numberOfLoops = 0
            player.prepareToPlay()
            player.play()
        } else {
            print("Could not create audio player: \(error!)")
        }
    }
    
}
