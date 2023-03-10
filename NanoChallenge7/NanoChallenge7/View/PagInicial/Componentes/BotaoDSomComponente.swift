//
//  BotaoDSomComponente.swift
//  NanoChallenge7
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 08/02/23.
//

import Foundation
import SwiftUI

struct BotaoDSomComponente: View {
    //MARK: - Global variables
    @Binding var somPermitido: Bool
    @State var tituloBotao = "speaker.wave.3.fill"
    @State var botaoFoiClicado = false
    
    //MARK: - Body
    var body: some View {
        HStack {
            Button {
                self.trocaTituloBotao()
            } label: {
                Image(systemName: self.tituloBotao)
            }
            .foregroundColor(Color("azulApp"))
        }
    }
    
    //MARK: - Functions here
    func trocaTituloBotao() {
        if botaoFoiClicado {
            self.tituloBotao = "speaker.wave.3.fill"
            self.botaoFoiClicado.toggle()
            self.somPermitido.toggle()
        } else {
            self.tituloBotao = "speaker.slash.fill"
            self.botaoFoiClicado.toggle()
            self.somPermitido.toggle()
        }
    }
}
