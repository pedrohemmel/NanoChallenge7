//
//  RespostasArteComponente.swift
//  NanoChallenge7
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 11/02/23.
//

import SwiftUI

struct RespostasArteComponente: View {
    //MARK: - Variáveis globais
    @Binding var somPermitido: Bool
    @Binding var acertouResposta: Bool
    @State var acaoAposResposta: (() -> Void)
    @State var possiveisRespostas: [Int]
    @State var respostaCerta: Int
    @State var ableToClick = true
    
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
                somPermitido: self.$somPermitido,
                able: self.$ableToClick,
                tituloBotao: "\(self.possiveisRespostas[0])",
                espacamentoHorizontalBotao: 10,
                curvaturaBotao: 20,
                acaoBotao: {
                    self.ableToClick = false
                    if self.verificaQuestaoCerta(resposta: self.possiveisRespostas[0]) {
                        self.acertouResposta = true
                        self.acaoAposResposta()
                        return Color.green
                    } else {
                        self.acertouResposta = false
                        self.acaoAposResposta()
                        return Color.red
                    }
                },
                width: UIScreen.screemWidth / 2 - 15)
            self.botaoRespostaB = BotaoPadraoComponente(
                somPermitido: self.$somPermitido,
                able: self.$ableToClick,
                tituloBotao: "\(self.possiveisRespostas[1])",
                espacamentoHorizontalBotao: 10,
                curvaturaBotao: 20,
                acaoBotao: {
                    self.ableToClick = false
                    if self.verificaQuestaoCerta(resposta: self.possiveisRespostas[1]) {
                        self.acertouResposta = true
                        self.acaoAposResposta()
                        return Color.green
                    } else {
                        self.acertouResposta = false
                        self.acaoAposResposta()
                        return Color.red
                    }
                },
                width: UIScreen.screemWidth / 2 - 15)
            self.botaoRespostaC = BotaoPadraoComponente(
                somPermitido: self.$somPermitido,
                able: self.$ableToClick,
                tituloBotao: "\(self.possiveisRespostas[2])",
                espacamentoHorizontalBotao: 10,
                curvaturaBotao: 20,
                acaoBotao: {
                    self.ableToClick = false
                    if self.verificaQuestaoCerta(resposta: self.possiveisRespostas[2]) {
                        self.acertouResposta = true
                        self.acaoAposResposta()
                        return Color.green
                    } else {
                        self.acertouResposta = false
                        self.acaoAposResposta()
                        return Color.red
                    }
                },
                width: UIScreen.screemWidth / 2 - 15)
            self.botaoRespostaD = BotaoPadraoComponente(
                somPermitido: self.$somPermitido,
                able: self.$ableToClick,
                tituloBotao: "\(self.possiveisRespostas[3])",
                espacamentoHorizontalBotao: 10,
                curvaturaBotao: 20,
                acaoBotao: {
                    self.ableToClick = false
                    if self.verificaQuestaoCerta(resposta: self.possiveisRespostas[3]) {
                        self.acertouResposta = true
                        self.acaoAposResposta()
                        return Color.green
                    } else {
                        self.acertouResposta = false
                        self.acaoAposResposta()
                        return Color.red
                    }
                },
                width: UIScreen.screemWidth / 2 - 15)
        }
    }
    
    func verificaQuestaoCerta(resposta: Int) -> Bool {
        if resposta == self.respostaCerta {
            return true
        }
        return false
    }
}
