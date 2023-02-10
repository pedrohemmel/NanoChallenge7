//
//  Model.swift
//  NanoChallenge7
//
//  Created by Victor Levenetz Mariano on 07/02/23.
//

import Foundation

struct ObraDeArteDataModel: Codable{
    var data: [ObraDeArteModel]
}

extension ObraDeArteDataModel: Equatable {
    static func == (lhs: ObraDeArteDataModel, rhs: ObraDeArteDataModel) -> Bool {
        return true
    }
}

