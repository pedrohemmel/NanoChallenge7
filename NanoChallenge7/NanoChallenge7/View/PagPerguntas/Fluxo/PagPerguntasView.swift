//
//  PagPerguntasView.swift
//  NanoChallenge7
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 09/02/23.
//

import SwiftUI

struct PagPerguntasView: View {
    //MARK: Variáveis globais
    @State var pagPerguntasViewModel = PagPerguntasViewModel()
    
    @State var obraDeArteModel: ObraDeArteModel?
    @State var cartaoArteComponente: CartaoArteComponente?
    @State var recebeuDados = false
    
    //MARK: - Body
    var body: some View {
        
        ZStack {
            if !recebeuDados {
                ProgressView()
            } else {
                VStack {
                    cartaoArteComponente
                }
                .onAppear {
                    //MARK: - OnAppear cartaoArteComponente
                    print(pagPerguntasViewModel.obraDeArteDataLoader?.obraDeArteDataModel?.data != nil)
                    self.obraDeArteModel = pagPerguntasViewModel.buscaObraDeArteRandomica()
                    
                    self.cartaoArteComponente = CartaoArteComponente(
                        autor: self.obraDeArteModel?.artist_display ?? "",
                        nomeObra: self.obraDeArteModel?.title ?? "",
                        localObra: self.obraDeArteModel?.place_of_origin ?? "",
                        materialObra: self.obraDeArteModel?.medium_display ?? "",
                        dimensaoObra: self.obraDeArteModel?.dimensions ?? "",
                        imagem_id: self.obraDeArteModel?.image_id ?? "")
                }
            }
            
        }
        .onAppear {
            //MARK: - OnAppear
            pagPerguntasViewModel.obraDeArteDataLoader = ObraDeArteDataLoader(recebeuDados: {
                self.recebeuDados = true
            })
            pagPerguntasViewModel.buscarObrasDeArte()
        }
    }
}
