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
    let population: Double
}
