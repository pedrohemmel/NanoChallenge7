//
//  ObraDeArteModel.swift
//  NanoChallenge7
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 08/02/23.
//

import Foundation

struct ObraDeArteModel: Codable {
    var id: Int
    var title: String
    var date_start: Int
    var date_end: Int
    var date_display: String
    var artist_display: String
    var place_of_origin: String
    var dimensions: String
    var medium_display: String
    var image_id: String
}
