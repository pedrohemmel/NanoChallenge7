//
//  ObraDeArteDataLoader.swift
//  NanoChallenge7
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 07/02/23.
//

import Foundation
import SwiftUI

class ObraDeArteDataLoader: ObservableObject {
    //MARK: - Variáveis globais
    @Published var obraDeArteDataModel: ObraDeArteDataModel?
    var recebeuDados: (() -> Void)
    
    //MARK: - Inicializador
    init(recebeuDados: @escaping (() -> Void)) {
        self.recebeuDados = recebeuDados
        self.buscarDados()
    }
    
    func buscarDados() {
        guard let url = URL(string: "https://api.artic.edu/api/v1/artworks?page=4&limit=20") else { return }
        
        //MARK: - URLSession
        URLSession.shared.dataTask(with: url) { dados, resposta, erro in
            if let erro = erro {
                print(erro)
                return
            }
            guard let dados = dados else {
                print("Data is nil")
                return
            }
//            if let dataString = String(data: dados, encoding: .utf8) {
//                print("got dataString: \n\(dataString)")
//            }
            
            do {
                let dadosDoJSON = try JSONDecoder().decode(ObraDeArteDataModel.self, from: dados)
                
                DispatchQueue.main.async {
                    self.obraDeArteDataModel = dadosDoJSON
                    self.recebeuDados()
                }
                return
            } catch {
                print("Error to fetch data from API: \(error)")
            }
        }.resume()
    }
}
