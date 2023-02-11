//
//  RespostasArteComponente.swift
//  NanoChallenge7
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 11/02/23.
//

import SwiftUI

struct RespostasArteComponente: View {
    //MARK: - Variáveis globais
    @State var botaoRespostaA = BotaoPadraoComponente(
        somPermitido: .constant(true),
        tituloBotao: "Pedro",
        espacamentoHorizontalBotao: 10,
        curvaturaBotao: 20,
        acaoBotao: {print("oi")})
    @State var botaoRespostaB = BotaoPadraoComponente(
        somPermitido: .constant(true),
        tituloBotao: "Pedro",
        espacamentoHorizontalBotao: 10,
        curvaturaBotao: 20,
        acaoBotao: {print("oi")})
    @State var botaoRespostaC = BotaoPadraoComponente(
        somPermitido: .constant(true),
        tituloBotao: "Pedro",
        espacamentoHorizontalBotao: 10,
        curvaturaBotao: 20,
        acaoBotao: {print("oi")})
    @State var botaoRespostaD = BotaoPadraoComponente(
        somPermitido: .constant(true),
        tituloBotao: "Pedro",
        espacamentoHorizontalBotao: 10,
        curvaturaBotao: 20,
        acaoBotao: {print("oi")})
    
    //MARK: - Body
    var body: some View {
        VStack {
            Text("Qual é a data de lançamento da obra de arte?")
                .fontWeight(.bold)
             HStack {
                 self.botaoRespostaA
                 self.botaoRespostaB
             }
             HStack{
                 self.botaoRespostaC
                 self.botaoRespostaD
             }
         }
    }
}

struct RespostasArteComponente_Previews: PreviewProvider {
    static var previews: some View {
        RespostasArteComponente()
    }
}
