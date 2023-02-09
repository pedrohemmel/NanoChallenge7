//
//  PagInicialViewModel.swift
//  NanoChallenge7
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 08/02/23.
//

import Foundation

final class PagInicialViewModel {
    func tocarSom() {
        AVAudio.sharedInstance.playSoundEffect("coinsound.wav")
    }
}
