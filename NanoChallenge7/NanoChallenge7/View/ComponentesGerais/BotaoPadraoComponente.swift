//
//  BotaoPadraoComponente.swift
//  NanoChallenge7
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 08/02/23.
//

import Foundation
import SwiftUI

struct BotaoPadraoComponente: View {
    //MARK: - Global variables
    @State var tituloBotao: String
    @State var espacamentoHorizontalBotao: CGFloat
    @State var curvaturaBotao: CGFloat
    @State var acaoBotao: (() -> Void)
    
    //MARK: - Body
     var body: some View {
         HStack {
             Button {
                 self.acaoBotao()
             } label: {
                 Text(self.tituloBotao)
                     .foregroundColor(.white)
             }
             .padding(.horizontal, self.espacamentoHorizontalBotao)
             .padding(.vertical, 20)
             .background(Color("azulApp"))
             .cornerRadius(self.curvaturaBotao)
         }
     }
}
