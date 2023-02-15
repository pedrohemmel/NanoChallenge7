//
//  PagResultado.swift
//  NanoChallenge7
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 13/02/23.
//

import SwiftUI

struct PagResultado: View {
    //MARK: - Environment variables
    @Environment(\.dismiss) var dismiss
    
    //MARK: - Variáveis globais
    @Binding var somPermitido: Bool
    @State var data: Data?
    @State var txtResultado = ""
    @Binding var estaFazendoDismiss: Bool
    
    var acaoDismiss: () -> Void
    var qtdAcertos: Int
    var imagem_id: String
    
    //MARK: - Views
    @State var botaoContinuar: BotaoPadraoComponente? = nil
    
    //MARK: - Body
    var body: some View {
        
        ZStack {
            VStack {
                Spacer()
                Spacer()
                Text(self.txtResultado)
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 15)
                Spacer()
                ZStack {
                    if let data = data, let uiImage = UIImage(data: data) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 300, alignment: .center)
                            .padding(.top, 5)
                        Image(uiImage: UIImage(named: "desfoqueFundo.png")!)
                            .resizable()
                            .frame(width: UIScreen.screemWidth, height: 300, alignment: .center)
                            .padding(.top, 5)
                    } else {
                        ProgressView()
                            .frame(height: 200, alignment: .center)
                            .padding(.top, 5)
                    }
                }
                .frame(width: UIScreen.screemWidth)
                Spacer()
                botaoContinuar
                Spacer()
                Spacer()
            }
            .frame(width: UIScreen.screemWidth)
        }
        .onAppear {
            //MARK: - OnAppear
            self.botaoContinuar = BotaoPadraoComponente(
                somPermitido: self.$somPermitido,
                able: .constant(true),
                tituloBotao: "Continue",
                acaoBotao: {
                    self.estaFazendoDismiss = true
                    dismiss()
                    self.acaoDismiss()
                    return Color("azuloApp")
                },
                espacamentoHorizontalBotao: 10,
                curvaturaBotao: 20,
                width: UIScreen.screemWidth / 1.5)
            self.buscarImagem(self.imagem_id)
            
            self.atribuiTextoResultado()
        }
        .navigationBarBackButtonHidden(true)
        .background(Color("backgroundApp"))
    }
    
    //MARK: - Funções aqui
    func buscarImagem(_ imagem: String) {
        guard let url = URL(string: "https://www.artic.edu/iiif/2/\(imagem)/full/843,/0/default.jpg") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            self.data = data
        }
        task.resume()
    }
    
    func atribuiTextoResultado() {
        if self.qtdAcertos >= 3 {
            self.txtResultado = "Congratulations, you got \(self.qtdAcertos)/5 questions!"
        } else {
            self.txtResultado = "Oh no... You got \(self.qtdAcertos)/5 questions, try again!"
        }
    }
}
