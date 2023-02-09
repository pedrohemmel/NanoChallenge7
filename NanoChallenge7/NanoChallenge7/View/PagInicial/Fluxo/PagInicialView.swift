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
            
            Button {
                print("Hello")
            } label: {
                Text("Quiz")
                    .foregroundColor(.white)
            }
            .padding([.top, .bottom], 20)
            .padding([.leading, .trailing], 50)
            .background(Color(uiColor: UIColor(named: "azulApp")!))
            .padding(.top, 50)

            Spacer()
        }
        .background(.white)
    }
}
