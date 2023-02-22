//
//  BotaoPadraoComponente.swift
//  NanoChallenge7
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 08/02/23.
//

import Foundation
import SwiftUI
import AVFoundation

struct BotaoPadraoComponente: View {
    //MARK: - Global variables
    @Binding var somPermitido: Bool
    @Binding var able: Bool
    
    var tituloBotao: String
    var acaoBotao: (() -> Color)
    
    @State var txtTituloBotao: String = ""
    @State var espacamentoHorizontalBotao: CGFloat
    @State var curvaturaBotao: CGFloat
    @State var width: CGFloat? = nil
    @State var colorOfButton = Color("azuloApp")
    
    //MARK: - Body
     var body: some View {
         HStack {
             Button {
                 if self.able {
                     self.colorOfButton = self.acaoBotao()
                     if self.somPermitido {
                         if colorOfButton == Color("azulApp") {
                             AVAudioInstance.playSoundEffect("entryGame.mp3")
                         } else if colorOfButton == Color("vermelhoApp") {
                             AVAudioInstance.playSoundEffect("wrong.mp3")
                         } else if colorOfButton == Color.green {
                             AVAudioInstance.playSoundEffect("right.mp3")
                         } else {
                             AVAudioInstance.playSoundEffect("tap.mpeg")
                         }
                     }
                     DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                         
                         self.colorOfButton = Color("azulApp")
                         self.able = true
                     }
                 }
             } label: {
                 Text(self.txtTituloBotao)
                     .foregroundColor(.white)
                     .padding(.horizontal, self.espacamentoHorizontalBotao)
                     .padding(.vertical, 20)
                     .frame(width: self.width)
             }
             .background(self.colorOfButton)
             .cornerRadius(self.curvaturaBotao)
         }
         .onAppear {
             self.txtTituloBotao = self.tituloBotao
         }
         .onChange(of: self.tituloBotao) { newTituloBotao in
             self.txtTituloBotao = newTituloBotao
         }
     }
}
