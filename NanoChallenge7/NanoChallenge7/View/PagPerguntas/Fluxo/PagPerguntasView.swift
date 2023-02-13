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
    @State var pagPerguntasViewModel = PagPerguntasViewModel()
    @State var possiveisRespostas = [Int]()
    
    @State var obraDeArteModel: ObraDeArteModel?
    @State var recebeuDados = false
    
    @State var tempoQuestao = 60
    @State var tempoEstaCorrendo = false
    let temporizador = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    //MARK: - Views
    @State var cartaoArteComponente: CartaoArteComponente?
    @State var respostasArteComponente: RespostasArteComponente?
    
    //MARK: - Body
    var body: some View {
        
        ZStack {
            if !recebeuDados {
                ProgressView()
            } else {
                VStack {
                    cartaoArteComponente
                    respostasArteComponente
                        .padding(.top, 10)
                }
                .onAppear {
                    //MARK: - OnAppear cartaoArteComponente
                    self.obraDeArteModel = pagPerguntasViewModel.buscaObraDeArteRandomica()
                    self.possiveisRespostas = self.pagPerguntasViewModel.gerarPossiveisRespostas(respostaCerta: Int(self.obraDeArteModel?.date_display ?? "0") ?? 0)
                    
                    self.cartaoArteComponente = CartaoArteComponente(
                        autor: self.obraDeArteModel?.artist_display ?? "",
                        nomeObra: self.obraDeArteModel?.title ?? "",
                        localObra: self.obraDeArteModel?.place_of_origin ?? "",
                        materialObra: self.obraDeArteModel?.medium_display ?? "",
                        dimensaoObra: self.obraDeArteModel?.dimensions ?? "",
                        imagem_id: self.obraDeArteModel?.image_id ?? "")
                    
                    self.respostasArteComponente = RespostasArteComponente(
                        possiveisRespostas: self.possiveisRespostas)
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
                        
                        Text("Sair")
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
            if recebeuDados {
                if self.tempoQuestao > 0 {
                    self.tempoQuestao -= 1
                }
            }
        }
    }
}
