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
    var imagem_id: String
    
    @State var data: Data?
    
    //MARK: - Body
    var body: some View {
        VStack {
            Text("\(autor)")
                .font(.system(size: 25))
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .foregroundColor(.black)
            
            if let data = data, let uiImage = UIImage(data: data) {
                Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 300, alignment: .center)
                    .padding(.top, 5)
            } else {
                ProgressView()
                    .frame(height: 150, alignment: .center)
                    .padding(.top, 5)
            }
            
            Text("\(nomeObra), \(localObra)")
                .font(.system(size: 15))
                .foregroundColor(Color(UIColor.gray))
                .padding(.top, 5)
            Text("\(materialObra)")
                .font(.system(size: 15))
                .foregroundColor(Color(UIColor.gray))
                .padding(.top, 3)
            Text("\(dimensaoObra)")
                .font(.system(size: 15))
                .foregroundColor(Color(UIColor.gray))
                .padding(.top, 3)
        }
        .padding()
        .frame(width: UIScreen.screemWidth - 30)
        .background(Color.white)
        .compositingGroup()
        .cornerRadius(10)
        .shadow(color: Color.gray, radius: 10, x: 1, y: 0)
        .onAppear {
            buscarImagem(self.imagem_id)
        }
        .onChange(of: self.imagem_id) { newImage in
            self.data = nil
            buscarImagem(newImage)
        }
    }
    
    //MARK: - Funções aqui
    func buscarImagem(_ imagem: String) {
        guard let url = URL(string: "https://www.artic.edu/iiif/2/\(imagem)/full/843,/0/default.jpg") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            self.data = data
        }
        task.resume()
    }
}





