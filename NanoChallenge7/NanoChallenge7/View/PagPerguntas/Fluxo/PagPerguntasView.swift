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
    @State var estaFazendoDismiss = false
    @State var acertouResposta = false
    @State var pagResultadoAtivo = false
    @State var mostraErroInternet = false
    
    @State var qtdPerguntas = 0
    @State var qtdAcertos = 0
    
    @State var pagPerguntasViewModel = PagPerguntasViewModel()
    @State var possiveisRespostas = [Int]()
    @State var obraDeArteModel: ObraDeArteModel?
    @State var arrObrasDeArteDaVez = [ObraDeArteModel]()
    
    @State var recebeuDados = false
    
    @State var tempoQuestao = 60
    @State var tempoEstaCorrendo = false
    let temporizador = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    //MARK: - Views
    @State var cartaoArteComponente: CartaoArteComponente?
    @State var respostasArteComponente: RespostasArteComponente?
    
    //MARK: - Body
    var body: some View {
        ScrollView {
            NavigationLink(
                destination: PagResultado(
                    somPermitido: $somPermitido,
                    estaFazendoDismiss: self.$estaFazendoDismiss, acaoDismiss: {
                        dismiss()
                    },
                    qtdAcertos: self.qtdAcertos,
                    imagem_id: self.obraDeArteModel?.image_id ?? ""),
                isActive: self.$pagResultadoAtivo,
                label: {})
            if !recebeuDados {
                VStack {
                    ProgressView()
                    if self.mostraErroInternet {
                        Text("Tem algo de errado com sua internet. Tente novamente mais tarde.")
                            .foregroundColor(Color("vermelhoApp"))
                    }
                }
                .frame(width: UIScreen.screemWidth, height: UIScreen.screenHeight)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 15) {
                        self.mostraErroInternet = true
                    }
                }
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
            
            ToolbarItem(placement: .principal) {
                if self.recebeuDados {
                    Text("\(self.qtdPerguntas)/5")
                }
            }
        }
        .frame(width: UIScreen.screemWidth, height: UIScreen.screenHeight)
        .background(Color("backgroundApp"))
        .onAppear {
            //MARK: - OnAppear
            if !self.estaFazendoDismiss {
                pagPerguntasViewModel.obraDeArteDataLoader = ObraDeArteDataLoader(recebeuDados: {
                    self.recebeuDados = true
                })
                pagPerguntasViewModel.buscarObrasDeArte()
            }
        }
        .onReceive(self.temporizador) { _ in
            //MARK: - OnReceive
            if recebeuDados {
                if qtdPerguntas < 5 {
                    if self.tempoQuestao > 0 {
                        self.tempoQuestao -= 1
                    } else {
                        self.tempoQuestao = 60
                        self.contabilizaPergunta()
                    }
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
    
    func verificaAcertoEIncrementaPergunta() {
        if self.acertouResposta {
            self.qtdAcertos += 1
        }
        if self.qtdPerguntas < 5 {
            self.qtdPerguntas += 1
        }
    }
    func contabilizaPergunta() {
        self.verificaAcertoEIncrementaPergunta()
        if self.qtdPerguntas < 5 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.tempoQuestao = 60
                setupComponents()
            }
            return
        }
        self.arrObrasDeArteDaVez = [ObraDeArteModel]()
        self.ativaPagResultado()
    }
    
    func setupComponents() {
        self.obraDeArteModel = pagPerguntasViewModel.buscaObraDeArteRandomica(arrObrasDeArteDaVez: self.arrObrasDeArteDaVez)
        self.possiveisRespostas = self.pagPerguntasViewModel.gerarPossiveisRespostas(respostaCerta: Int(self.obraDeArteModel?.date_display ?? "0") ?? 0)
        self.arrObrasDeArteDaVez.append(self.obraDeArteModel ?? ObraDeArteModel(id: -1, title: ""))
        
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
