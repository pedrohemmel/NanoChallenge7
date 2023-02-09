//
//  Card_Exibicao_Imagem.swift
//  NanoChallenge7
//
//  Created by Higor  Lo Castro on 08/02/23.
//

import SwiftUI

struct Card_Exibicao_Imagem: View {
    //MARK: - Variáveis globais
    var autor: String
    var nomeObra: String
    var localObra: String
    var materialObra: String
    var dimensaoObra: String
    
    //MARK: - Body
    var body: some View {
        VStack {
            Text("\(autor)")
                .font(.largeTitle)
                .foregroundColor(.black)
            
            Image("Vang_Gogh_Teste")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 200, alignment: .center)
                .padding(.top, 5)
            
            Text("\(nomeObra), \(localObra)")
                .font(.title3)
                .foregroundColor(Color(UIColor.gray))
                .padding(.top, 5)
            Text("\(materialObra)")
                .font(.title3)
                .foregroundColor(Color(UIColor.gray))
                .padding(.top, 5)
            Text("\(dimensaoObra)")
                .font(.title3)
                .foregroundColor(Color(UIColor.gray))
                .padding(.top, 5)
        }
        .padding()
        .background(Color.white)
        .compositingGroup()
        .cornerRadius(10)
        .shadow(color: Color.gray, radius: 10, x: 5, y: 0)
       
        
    }
}



struct CarExibicaoImagem_Previews: PreviewProvider {
    static var previews: some View {
        Card_Exibicao_Imagem(autor: "Diego", nomeObra: "Monalisa", localObra: "Brazil", materialObra: "Acrílico", dimensaoObra: "30 x 40")
    }
}





