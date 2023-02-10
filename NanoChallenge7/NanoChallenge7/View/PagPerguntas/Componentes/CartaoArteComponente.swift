//
//  Card_Exibicao_Imagem.swift
//  NanoChallenge7
//
//  Created by Higor  Lo Castro on 08/02/23.
//

import SwiftUI

struct CartaoArteComponente: View {
    //MARK: - Variáveis globais
    var autor: String
    var nomeObra: String
    var localObra: String
    var materialObra: String
    var dimensaoObra: String
    var imagem_id: String {
        didSet {
            buscarImagem()
        }
    }
    
    @State var data: Data?
    
    //MARK: - Body
    var body: some View {
        VStack {
            Text("\(autor)")
                .font(.system(size: 30))
                .fontWeight(.bold)
                .foregroundColor(.black)
            
            
            if let data = data, let uiImage = UIImage(data: data) {
                Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 150, alignment: .center)
                    .padding(.top, 5)
            } else {
                ProgressView()
                    .frame(height: 150, alignment: .center)
                    .padding(.top, 5)
            }
            
            Text("\(nomeObra), \(localObra)")
                .font(.system(size: 18))
                .foregroundColor(Color(UIColor.gray))
                .padding(.top, 5)
            Text("\(materialObra)")
                .font(.system(size: 18))
                .foregroundColor(Color(UIColor.gray))
                .padding(.top, 3)
            Text("\(dimensaoObra)")
                .font(.system(size: 18))
                .foregroundColor(Color(UIColor.gray))
                .padding(.top, 3)
        }
        .padding()
        .background(Color.white)
        .compositingGroup()
        .cornerRadius(10)
        .shadow(color: Color.gray, radius: 10, x: 2, y: 0)
        .onAppear {
            buscarImagem()
        }
    }
    
    func buscarImagem() {
        guard let url = URL(string: "https://www.artic.edu/iiif/2/\(self.imagem_id)/full/843,/0/default.jpg") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            self.data = data
        }
        task.resume()
    }
}





