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
    @Binding var somPermitido: Bool
    @Binding var able: Bool
    
    @State var tituloBotao: String
    @State var espacamentoHorizontalBotao: CGFloat
    @State var curvaturaBotao: CGFloat
    @State var acaoBotao: (() -> Color)
    @State var width: CGFloat? = nil
    @State var colorOfButton = Color("azulApp")
    
    //MARK: - Body
     var body: some View {
         HStack {
             Button {
                 if self.able {
                     if self.somPermitido {
                         
                     }
                     self.colorOfButton = self.acaoBotao()
                 }
             } label: {
                 Text(self.tituloBotao)
                     .foregroundColor(.white)
                     .padding(.horizontal, self.espacamentoHorizontalBotao)
                     .padding(.vertical, 20)
                     .frame(width: self.width)
             }
             .background(self.colorOfButton)
             .cornerRadius(self.curvaturaBotao)
         }
     }
}
