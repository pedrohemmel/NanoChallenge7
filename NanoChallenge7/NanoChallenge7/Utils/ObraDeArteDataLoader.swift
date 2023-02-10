//
//  ObraDeArteDataLoader.swift
//  NanoChallenge7
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 07/02/23.
//

import Foundation

class ObraDeArteDataLoader: ObservableObject {
    //MARK: - Variáveis globais
    @Published var obraDeArteDataModel: ObraDeArteDataModel?
    
    //MARK: - Inicializador
    init() {
        self.buscarDados()
    }
    
    func buscarDados() {
        guard let url = URL(string: "https://api.artic.edu/api/v1/artworks?page=2&limit=10") else { return }
        
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
            if let dataString = String(data: dados, encoding: .utf8) {
//                print("got dataString: \n\(dataString)")
            }
            do {
                let dadosDoJSON = try JSONDecoder().decode(ObraDeArteDataModel.self, from: dados)
                
                DispatchQueue.main.async {
                    self.obraDeArteDataModel = dadosDoJSON
                }
                return
            } catch {
                print("Error to fetch data from API: \(error)")
            }
        }.resume()
    }
}
