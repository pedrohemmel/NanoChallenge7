//
//  PagPerguntasView.swift
//  NanoChallenge7
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 09/02/23.
//

import SwiftUI

struct PagPerguntasView: View {
    //MARK: - Variável de controle de ambeiente
    @Environment(\.dismiss) var dismiss
 
    //MARK: Variáveis globais
    @Binding var somPermitido: Bool
    @State var acertouResposta = false
    @State var pagResultadoAtivo = false
    
    @State var qtdPerguntas = 1
    @State var qtdAcertos = 0
    
    @State var pagPerguntasViewModel = PagPerguntasViewModel()
    @State var possiveisRespostas = [Int]()
    
    @State var obraDeArteModel: ObraDeArteModel?
    @State var recebeuDados = false
    
    var oba = false
    
    @State var tempoQuestao = 10
    @State var tempoEstaCorrendo = false
    let temporizador = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    //MARK: - Views
    @State var cartaoArteComponente: CartaoArteComponente?
    @State var respostasArteComponente: RespostasArteComponente?
    
    //MARK: - Body
    var body: some View {
        ScrollView {
            NavigationLink(destination: PagResultado(), isActive: self.$pagResultadoAtivo, label: {})
            if !recebeuDados {
                VStack {
                    ProgressView()
                }
                .frame(width: UIScreen.screemWidth, height: UIScreen.screenHeight)
            } else {
                VStack {
                    cartaoArteComponente
                        .padding(.top, 70)
                    respostasArteComponente
                        .padding(.top, 10)
                        .padding(.bottom, 50)
                }
                .frame(width: UIScreen.screemWidth)
                .onAppear {
                    //MARK: - OnAppear cartaoArteComponente
                    self.setupComponents()
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            //MARK: - Toolbar
            ToolbarItem(placement: .navigationBarTrailing) {
                if self.recebeuDados {
                    Button(action: {
                        dismiss()
                    }, label: {
                        
                        Text("Exit")
                            .fontWeight(.bold)
                            .foregroundColor(Color("azulApp"))
                    })
                }
            }
            ToolbarItem(placement: .navigationBarLeading) {
                if self.recebeuDados {
                    HStack {
                        Image(systemName: "timer")
                            .foregroundColor(Color("vermelhoApp"))
                        if tempoQuestao < 10 {
                            Text("00:0\(self.tempoQuestao)")
                                .foregroundColor(Color("vermelhoApp"))
                        } else {
                            Text("00:\(self.tempoQuestao)")
                                .foregroundColor(Color("vermelhoApp"))
                        }
                    }
                }
            }
        }
        .frame(width: UIScreen.screemWidth, height: UIScreen.screenHeight)
        .background(Color("backgroundApp"))
        .onAppear {
            //MARK: - OnAppear
            pagPerguntasViewModel.obraDeArteDataLoader = ObraDeArteDataLoader(recebeuDados: {
                self.recebeuDados = true
            })
            pagPerguntasViewModel.buscarObrasDeArte()
        }
        .onReceive(self.temporizador) { _ in
            //MARK: - OnReceive
            if recebeuDados {
                if self.tempoQuestao > 0 {
                    self.tempoQuestao -= 1
                } else {
                    self.tempoQuestao = 10
                    self.contabilizaPergunta()
                }
            }
        }
    }
    
    //MARK: - Functions here
    func ativaPagResultado() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.pagResultadoAtivo = true
        }
    }
    
    func contabilizaPergunta() {
        if self.qtdPerguntas < 5 {
            self.verificaAcertoEIncrementaPergunta()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                setupComponents()
            }
            return
        }
        self.verificaAcertoEIncrementaPergunta()
        print("Perguntas: \(self.qtdPerguntas) || Acertos: \(self.qtdAcertos)")
        self.ativaPagResultado()
    }
    
    func verificaAcertoEIncrementaPergunta() {
        if self.acertouResposta {
            self.qtdAcertos += 1
        }
        self.qtdPerguntas += 1
    }
    
    func setupComponents() {
        self.obraDeArteModel = pagPerguntasViewModel.buscaObraDeArteRandomica(atualObraDeArte: self.obraDeArteModel ?? ObraDeArteModel(id: -1, title: ""))
        self.possiveisRespostas = self.pagPerguntasViewModel.gerarPossiveisRespostas(respostaCerta: Int(self.obraDeArteModel?.date_display ?? "0") ?? 0)
        
        self.cartaoArteComponente = CartaoArteComponente(
            autor: self.obraDeArteModel?.artist_display ?? "",
            nomeObra: self.obraDeArteModel?.title ?? "",
            localObra: self.obraDeArteModel?.place_of_origin ?? "",
            materialObra: self.obraDeArteModel?.medium_display ?? "",
            dimensaoObra: self.obraDeArteModel?.dimensions ?? "",
            imagem_id: self.obraDeArteModel?.image_id ?? "")
        
        self.respostasArteComponente = RespostasArteComponente(
            somPermitido: self.$somPermitido,
            acertouResposta: self.$acertouResposta,
            acaoAposResposta: {
                self.contabilizaPergunta()
            },
            possiveisRespostas: self.possiveisRespostas,
            respostaCerta: Int(self.obraDeArteModel?.date_display ?? "0") ?? 0)
    }
}
