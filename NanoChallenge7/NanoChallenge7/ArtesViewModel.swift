//
//  ArtesViewModel.swift
//  NanoChallenge7
//
//  Created by Victor Levenetz Mariano on 07/02/23.
//

import Foundation

import Combine

final class ArtesViewModel: ObservableObject {
    
    init() {
        fetchPost()
    }
    
    @Published var Artes = [artes]()
    
    let webService = WebServices()
    
    private func fetchPost() {
        webService.getAll() {
            
            if $0 != nil {
                self.Artes = $0!
            }
        }
    }
}
