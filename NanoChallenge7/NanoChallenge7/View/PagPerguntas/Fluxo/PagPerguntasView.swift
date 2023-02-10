//
//  PagPerguntasView.swift
//  NanoChallenge7
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 09/02/23.
//

import SwiftUI

struct PagPerguntasView: View {
    //MARK: Variáveis globais
    private var pagPerguntasViewModel = PagPerguntasViewModel()
    
    @State var obraDeArteDataModel: ObraDeArteDataModel
    @State var cartaoArteComponente: CartaoArteComponente?
    
    //MARK: - Initializer
    init() {
        self.obraDeArteDataModel = pagPerguntasViewModel.buscarObrasDeArte()
    }
    
    //MARK: - Body
    var body: some View {
        VStack {
            cartaoArteComponente
        }
        .onAppear {
            //MARK: - OnAppear
            
        }
        .onChange(of: self.obraDeArteDataModel) { _ in
            print("Ola")
        }
    }
}
