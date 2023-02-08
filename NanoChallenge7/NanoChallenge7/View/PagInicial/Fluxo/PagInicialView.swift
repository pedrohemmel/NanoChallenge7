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
            .padding(.trailing, 15)
            Spacer()
        }
        .background(Color(uiColor: UIColor(named: "begeApp")!))
    }
}
