//
//  Country.swift
//  Lab25Concurrency-Countries
//
//  Created by Juan Ceballos on 12/9/19.
//  Copyright © 2019 Juan Ceballos. All rights reserved.
//

import Foundation

struct Country: Decodable   {
    let name: String
    let alpha2Code: String
    let capital: String
    let population: Int
    var flagURL: String {
        return "https://www.countryflags.io/\(alpha2Code)/flat/64.png"
    }
    var lowercasedName: String {
        return name.lowercased()
    }
}
