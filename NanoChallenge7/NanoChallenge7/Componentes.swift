//
//  Componentes.swift
//  NanoChallenge7
//
//  Created by Victor Levenetz Mariano on 08/02/23.
//

import Foundation
import SwiftUI

struct vistateste: View {
    var body: some View {
        VStack {
          //  botao()
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}



struct conjuntoBotao: View{
    
    var body:some View{
        HStack{
            VStack{
                botao(textoBotao: "botao")
                botao(textoBotao: "botao")
            }
            VStack{
                botao(textoBotao: "botao")
                botao(textoBotao: "botao")
            }
        }
    }
}

struct botao: View{
    @State var textoBotao: String
    
    
    var body: some View{
       
        HStack{
           // Text("isso")
            Button {
                print("isso")
            } label: {
                Text(textoBotao)
                    .padding(.horizontal, 70)
                    .padding(.vertical, 20)
                    .background(Color("VerdeBotao"))
                    .cornerRadius(15)
                    .padding(.horizontal, 2)
                    .foregroundColor(.white)
                  
                    
            }

        }
       
        }
       
    }


struct teste: PreviewProvider {
    static var previews: some View {
        //vistateste()
        conjuntoBotao()
    }
}
