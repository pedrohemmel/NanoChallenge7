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
    
    func verificaSeOAnoEstaFormatado(ano: String) -> Bool {
        if Int(ano) != nil {
            return true
        }
        return false
    }
    func estruturaCondicionalDeTratativa(numAleatorio: Int, atualObraDeArte: ObraDeArteModel) -> Bool {
        if !self.verificaSeOAnoEstaFormatado(ano: self.obraDeArteDataLoader?.obraDeArteDataModel?.data[numAleatorio].date_display ?? "") && self.obraDeArteDataLoader?.obraDeArteDataModel?.data[numAleatorio].id != atualObraDeArte.id {
            return true
        } else {
            return false
        }
    }
    func buscaObraDeArteRandomica(atualObraDeArte: ObraDeArteModel) -> ObraDeArteModel {
        var numAleatorio = Int.random(in: 0...(self.obraDeArteDataLoader?.obraDeArteDataModel!.data.count ?? 1)-1)
        
        
        while self.estruturaCondicionalDeTratativa(numAleatorio: numAleatorio, atualObraDeArte: atualObraDeArte) {
            numAleatorio = Int.random(in: 0...(self.obraDeArteDataLoader?.obraDeArteDataModel!.data.count ?? 1)-1)
        }
        
        return self.obraDeArteDataLoader?.obraDeArteDataModel!.data[numAleatorio] ?? ObraDeArteModel(id: 0, title: "", date_start: 0, date_end: 0, date_display: "", artist_display: "", place_of_origin: "", dimensions: "", medium_display: "", image_id: "")
    }
    
    func gerarPossiveisRespostas(respostaCerta: Int) -> [Int] {
        var arrayRespostas = [Int]()
    
        for i in 0...3 {
            if i < 1 {
                arrayRespostas.append(respostaCerta)
            } else {
                let numAleatorio = Int.random(in: (respostaCerta - 50)...(respostaCerta + 50))
                arrayRespostas.append(numAleatorio)
            }
        }
        arrayRespostas.shuffle()
        
        
        return arrayRespostas
    }
    
    
}
