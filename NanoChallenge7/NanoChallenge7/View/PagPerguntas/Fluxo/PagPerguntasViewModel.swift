//
//  PagPerguntasViewModel.swift
//  NanoChallenge7
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 09/02/23.
//

import Foundation

class PagPerguntasViewModel {
    func buscarObrasDeArte() -> ObraDeArteDataModel {
        return ObraDeArteDataLoader().obraDeArteDataModel ?? ObraDeArteDataModel(data: [ObraDeArteModel]())
    }
}
