//
//  RespostasArteComponente.swift
//  NanoChallenge7
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 11/02/23.
//

import SwiftUI

struct RespostasArteComponente: View {
    //MARK: - Variáveis globais
    @State var possiveisRespostas: [Int]
    
    //MARK: - Views
    @State var botaoRespostaA: BotaoPadraoComponente?
    @State var botaoRespostaB: BotaoPadraoComponente?
    @State var botaoRespostaC: BotaoPadraoComponente?
    @State var botaoRespostaD: BotaoPadraoComponente?
    
    //MARK: - Body
    var body: some View {
        VStack {
            Text("What is the launch year of this artwork?")
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
        .onAppear {
            self.botaoRespostaA = BotaoPadraoComponente(
                somPermitido: .constant(true),
                tituloBotao: "Pedro",
                espacamentoHorizontalBotao: 10,
                curvaturaBotao: 20,
                acaoBotao: {},
                width: UIScreen.screemWidth / 2 - 15)
            self.botaoRespostaB = BotaoPadraoComponente(
                somPermitido: .constant(true),
                tituloBotao: "Pedro",
                espacamentoHorizontalBotao: 10,
                curvaturaBotao: 20,
                acaoBotao: {},
                width: UIScreen.screemWidth / 2 - 15)
            self.botaoRespostaC = BotaoPadraoComponente(
                somPermitido: .constant(true),
                tituloBotao: "Pedro",
                espacamentoHorizontalBotao: 10,
                curvaturaBotao: 20,
                acaoBotao: {},
                width: UIScreen.screemWidth / 2 - 15)
            self.botaoRespostaD = BotaoPadraoComponente(
                somPermitido: .constant(true),
                tituloBotao: "Pedro",
                espacamentoHorizontalBotao: 10,
                curvaturaBotao: 20,
                acaoBotao: {},
                width: UIScreen.screemWidth / 2 - 15)
        }
    }
}
