//
//  SplashScreenView.swift
//  Quizart
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 16/02/23.
//

import SwiftUI

struct SplashScreenView: View {
    //MARK: - Variáveis globais
    @State var mostraPaginaPrincipal = false
    @State var tamanho = 0.8
    @State var opacidade = 0.0
    
    var body: some View {
        if mostraPaginaPrincipal {
            PagInicialView()
        } else {
            VStack {
                Image(uiImage: UIImage(named: "logoDefinido")!)
                    .resizable()
                    .frame(width: UIScreen.screemWidth / 1.5, height: UIScreen.screemWidth / 1.5)
                    .position(x: UIScreen.screemWidth/2, y: UIScreen.screenHeight/2 - UIScreen.screenHeight*0.113)
                    .scaleEffect(self.tamanho)
                    .opacity(self.opacidade)
                    .onAppear {
                        withAnimation(.easeIn(duration: 1.2)) {
                            self.tamanho = 1
                            self.opacidade = 1
                        }
                    }
                    
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute: {
                    self.mostraPaginaPrincipal = true
                })
            }
        }
        
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
