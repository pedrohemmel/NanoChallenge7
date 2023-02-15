//
//  PagInicialView.swift
//  NanoChallenge7
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 08/02/23.
//

import Foundation
import SwiftUI

struct PagInicialView: View {
    //MARK: - Global variables
    private var pagInicialViewModel = PagInicialViewModel()
    @State var comecaPerguntas = false
    @State var somPermitido = true
    
    //MARK: - Views
    @State var botaoDSomComponente: BotaoDSomComponente?
    @State var comecaQuizBotaoPadraoComponente: BotaoPadraoComponente?
    
    //MARK: - Body
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    botaoDSomComponente
                    Spacer()
                }
                .padding(.leading, 15)
                Spacer()
                Image(uiImage: UIImage(named: "logoDefinido")!)
                    .resizable()
                    .frame(width: UIScreen.screemWidth / 1.5, height: UIScreen.screemWidth / 1.5)
                
                comecaQuizBotaoPadraoComponente
                    .padding(.top, 50)
                Spacer()
            }
            .background(Color("backgroundApp"))
            .onAppear {
                //MARK: - OnAppear
                self.botaoDSomComponente = BotaoDSomComponente(somPermitido: self.$somPermitido)
                self.comecaQuizBotaoPadraoComponente = BotaoPadraoComponente(
                    somPermitido: self.$somPermitido,
                    able: .constant(true),
                    tituloBotao: "Start Quiz",
                    acaoBotao: {
                        self.comecaPerguntas = true
                        return Color("azulApp")
                    },
                    espacamentoHorizontalBotao: 10,
                    curvaturaBotao: 20,
                    width: UIScreen.screemWidth / 1.5,
                    colorOfButton: Color("azulApp"))
            }
            .navigationDestination(isPresented: $comecaPerguntas) {
                PagPerguntasView(somPermitido: self.$somPermitido)
            }
        }
    }
}
