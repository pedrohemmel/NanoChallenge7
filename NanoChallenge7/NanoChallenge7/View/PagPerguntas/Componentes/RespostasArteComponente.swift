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
    @State var ableToClick = true
    @State var permitirSetupDosComponentes = false
    
    var possiveisRespostas: [Int]
    var respostaCerta: Int
    @State var possiveisRespostasAtualizadas = [Int]()
    @State var respostaCertaAtualizada = 0
    
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
            self.setupComponents(possiveisRespostas: self.possiveisRespostas, respostaCerta: self.respostaCerta)
        }
        .onChange(of: self.possiveisRespostas) { newPossiveisRespostas in
            if self.permitirSetupDosComponentes {
                self.setupComponents(possiveisRespostas: newPossiveisRespostas, respostaCerta: self.respostaCertaAtualizada)
            } else {
                self.permitirSetupDosComponentes = true
                self.possiveisRespostasAtualizadas = newPossiveisRespostas
            }
        }
        .onChange(of: self.respostaCerta) { newRespostaCerta in
            if self.permitirSetupDosComponentes {
                self.setupComponents(possiveisRespostas: self.possiveisRespostasAtualizadas, respostaCerta: newRespostaCerta)
            } else {
                self.permitirSetupDosComponentes = true
                self.respostaCertaAtualizada = newRespostaCerta
            }
        }
        .onChange(of: self.permitirSetupDosComponentes) { newValue in
            if self.permitirSetupDosComponentes {
                self.setupComponents(
                    possiveisRespostas: self.possiveisRespostas,
                    respostaCerta: self.respostaCerta)
            }
        }
    }
    
    //MARK: - Funções aqui
    func limpandoVariaveis() {
        self.possiveisRespostasAtualizadas = [Int]()
        self.respostaCertaAtualizada = 0
        self.permitirSetupDosComponentes = false
    }
    
    func verificaQuestaoCerta(resposta: Int, respostaCerta: Int) -> Bool {
        self.limpandoVariaveis()
        if resposta == respostaCerta {
            return true
        }
        return false
    }
    
    func setupComponents(possiveisRespostas: [Int], respostaCerta: Int) {
        self.botaoRespostaA = BotaoPadraoComponente(
            somPermitido: self.$somPermitido,
            able: self.$ableToClick,
            tituloBotao: "\(possiveisRespostas[0])",
            espacamentoHorizontalBotao: 10,
            curvaturaBotao: 20,
            acaoBotao: {
                self.ableToClick = false
                if self.verificaQuestaoCerta(resposta: possiveisRespostas[0], respostaCerta: respostaCerta) {
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
            tituloBotao: "\(possiveisRespostas[1])",
            espacamentoHorizontalBotao: 10,
            curvaturaBotao: 20,
            acaoBotao: {
                self.ableToClick = false
                if self.verificaQuestaoCerta(resposta: possiveisRespostas[1], respostaCerta: respostaCerta) {
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
            tituloBotao: "\(possiveisRespostas[2])",
            espacamentoHorizontalBotao: 10,
            curvaturaBotao: 20,
            acaoBotao: {
                self.ableToClick = false
                if self.verificaQuestaoCerta(resposta: possiveisRespostas[2], respostaCerta: respostaCerta) {
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
            tituloBotao: "\(possiveisRespostas[3])",
            espacamentoHorizontalBotao: 10,
            curvaturaBotao: 20,
            acaoBotao: {
                self.ableToClick = false
                if self.verificaQuestaoCerta(resposta: possiveisRespostas[3], respostaCerta: respostaCerta) {
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
