//
//  ObraDeArteDataLoader.swift
//  NanoChallenge7
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 07/02/23.
//

import Foundation

final class ObraDeArteDataLoader {
    
    var arrObraDeArteModel = [ObraDeArteModel]()
    
    init() {
        self.buscarDados()
    }
    
    func buscarDados() {
        guard let url = URL(string: "https://api.artsy.net/api/artworks?client_id=aaabe76906f70a3c1c01&client_secret=d59c42cfc62acc61fc4d1ad2e106c406") else { return }
        
        print(url)
        
        URLSession.shared.dataTask(with: url) { data, resp, err in
            
            if err != nil {
                DispatchQueue.main.async {
                    print(err!)
                }
                return
            }
            
            let posts = try? JSONDecoder().decode([ObraDeArteModel].self, from: data!)
            
            DispatchQueue.main.async {
                self.arrObraDeArteModel = posts ?? [ObraDeArteModel]()
            }
            
        }.resume()
    }
}
