//
//  AVAudio.swift
//  NanoChallenge7
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 09/02/23.
//

import Foundation
import AVFoundation

public let AVAudioInstance = AVAudio()

open class AVAudio {
    
    open var soundEffectPlayer: AVAudioPlayer?
    
    open class func sharedInstance() -> AVAudio {
        return AVAudioInstance
    }
    
    public func playSoundEffect(_ filename: String) {
        let url = Bundle.main.url(forResource: filename,
                                  withExtension: nil)
        if (url == nil) {
            print("Could not find file: \(filename)")
            return
        }
        
        var error: NSError? = nil;
        
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
        
//        do {
//            backgroundMusicPlayer = try AVAudioPlayer(contentsOf:
//                url!)
//        } catch let undefinedBackgroundMusic as NSError {
//            error = undefinedBackgroundMusic
//            backgroundMusicPlayer = nil
//        }
//
//        if let player = backgroundMusicPlayer {
//            player.numberOfLoops = 0
//            player.prepareToPlay()
//            player.play()
//        } else {
//            print("Could not create audio player: \(error!)")
//        }
    }
}



//
//
//public let AVAudioInstance = AVAudio()
//
//open class AVAudio {
//
//    open var backgroundMusicPlayer: AVAudioPlayer?
//    open var soundEffectPlayer: AVAudioPlayer?
//    open var secondarySoundEffectPlayer: AVAudioPlayer?
//
//    open class func sharedInstance() -> AVAudio {
//        return AVAudioInstance
//    }
//
//    open func playBackgroundMusic(_ filename: String) {
//        let url = Bundle.main.url(forResource: filename,
//                                  withExtension: nil)
//        if (url == nil) {
//            print("Could not find file: \(filename)")
//            return
//        }
//
//        var error: NSError? = nil
//
//        do {
//            backgroundMusicPlayer = try AVAudioPlayer(contentsOf:
//                url!)
//        } catch let undefinedBackgroundMusic as NSError {
//            error = undefinedBackgroundMusic
//            backgroundMusicPlayer = nil
//        }
//
//        if let player = backgroundMusicPlayer {
//            player.numberOfLoops = -1
//            player.prepareToPlay()
//            player.play()
//        } else {
//            print("Could not create audio player: \(error!)")
//        }
//
//    }
//
//    open func pauseBackgroundMusic() {
//        if let player = backgroundMusicPlayer {
//            if player.isPlaying {
//                player.pause()
//            }
//        }
//    }
//
//    open func resumeBackgroundMusic() {
//        if let player = backgroundMusicPlayer {
//            if !player.isPlaying {
//                player.play()
//            }
//        }
//    }
//
//    open func playSoundEffect(_ filename: String) {
//        let url = Bundle.main.url(forResource: filename,
//                                  withExtension: nil)
//        if (url == nil) {
//            print("Could not find file: \(filename)")
//            return
//        }
//        var error: NSError? = nil
//        do {
//            self.soundEffectPlayer = try AVAudioPlayer(contentsOf: url!)
//        } catch let undefinedSoundEffect as NSError {
//            error = undefinedSoundEffect
//            self.soundEffectPlayer = nil
//        }
//        if let player = self.soundEffectPlayer {
//            player.numberOfLoops = 0
//            player.prepareToPlay()
//            player.play()
//        } else {
//            print("Could not create audio player: \(error!)")
//        }
//    }
//
//    //Função criada para caso tenha algum som de efeito que tenha que tocar ao mesmo tempo que outro sem dar conflito
//    open func playSecondarySoundEffect(_ filename: String) {
//        let url = Bundle.main.url(forResource: filename,
//                                  withExtension: nil)
//        if (url == nil) {
//            print("Could not find file: \(filename)")
//            return
//        }
//        var error: NSError? = nil
//        do {
//            self.secondarySoundEffectPlayer = try AVAudioPlayer(contentsOf: url!)
//        } catch let undefinedSoundEffect as NSError {
//            error = undefinedSoundEffect
//            self.secondarySoundEffectPlayer = nil
//        }
//        if let player = self.secondarySoundEffectPlayer {
//            player.numberOfLoops = 0
//            player.prepareToPlay()
//            player.play()
//        } else {
//            print("Could not create audio player: \(error!)")
//        }
//    }
//}
