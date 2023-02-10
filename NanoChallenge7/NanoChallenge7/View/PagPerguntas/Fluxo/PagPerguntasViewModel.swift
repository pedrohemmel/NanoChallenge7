//
//  PagPerguntasViewModel.swift
//  NanoChallenge7
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 09/02/23.
//

import Foundation
import SwiftUI

class PagPerguntasViewModel {
    
    var obraDeArteDataLoader: ObraDeArteDataLoader = ObraDeArteDataLoader()
    
    func buscarObrasDeArte() {
        self.obraDeArteDataLoader.buscarDados()
    }
    
    func buscaObraDeArteRandomica() -> ObraDeArteModel {
        let randomNumber = Int.random(in: 0...obraDeArteDataLoader.obraDeArteDataModel!.data.count-1)
        
        return obraDeArteDataLoader.obraDeArteDataModel!.data[randomNumber]
    }
}
