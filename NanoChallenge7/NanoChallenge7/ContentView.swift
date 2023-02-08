//
//  ContentView.swift
//  NanoChallenge7
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 03/02/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var obraDeArte = ObraDeArteDataLoader()
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: "https://www.artic.edu/iiif/2/\(obraDeArte.obraDeArteDataModel?.data[0].image_id ?? "")/full/843,/0/default.jpg"))
            
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
