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
    @State var botaoDSomComponente = BotaoDSomComponente()
    @State var comecaQuizBotaoPadraoComponente = BotaoPadraoComponente(
        tituloBotao: "Start Quiz",
        espacamentoHorizontalBotao: 50,
        curvaturaBotao: 30,
        acaoBotao: {AVAudio.sharedInstance().playSoundEffect("coinsound.wav")})
    
    //MARK: - Body
    var body: some View {
        VStack {
            HStack {
                botaoDSomComponente
                Spacer()
            }
            .padding(.leading, 15)
            Spacer()
            Image(uiImage: UIImage(named: "LogoDefinido")!)
                .resizable()
                .frame(width: UIScreen.screemWidth / 2, height: UIScreen.screemWidth / 2)
            comecaQuizBotaoPadraoComponente
                .padding(.top, 50)
            Spacer()
        }
        .background(.white)
    }
}
