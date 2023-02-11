//
//  PagPerguntasViewModel.swift
//  NanoChallenge7
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 09/02/23.
//

import Foundation
import SwiftUI

class PagPerguntasViewModel {
    var obraDeArteDataLoader: ObraDeArteDataLoader?
    
    func buscarObrasDeArte() {
        self.obraDeArteDataLoader?.buscarDados()
    }
    
    func buscaObraDeArteRandomica() -> ObraDeArteModel {
        let randomNumber = Int.random(in: 0...(obraDeArteDataLoader?.obraDeArteDataModel!.data.count ?? 1)-1)
        
        return obraDeArteDataLoader?.obraDeArteDataModel!.data[randomNumber] ?? ObraDeArteModel(id: 0, title: "", date_start: 0, date_end: 0, date_display: "", artist_display: "", place_of_origin: "", dimensions: "", medium_display: "", image_id: "")
    }
}
