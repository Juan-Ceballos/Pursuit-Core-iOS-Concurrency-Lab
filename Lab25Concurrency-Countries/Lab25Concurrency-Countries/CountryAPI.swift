//
//  CountryAPI.swift
//  Lab25Concurrency-Countries
//
//  Created by Juan Ceballos on 12/9/19.
//  Copyright © 2019 Juan Ceballos. All rights reserved.
//

import Foundation

struct CountryAPI   {
    
    static func getCountries() -> [Country]  {
        let urlString = "https://restcountries.eu/rest/v2/name/united"
        var countries = [Country]()
        NetworkHelper.shared.performDataTask(with: urlString) { (result) in
            switch result   {
            case .failure(let appError):
                print("App Error: \(appError)")
            case .success(let data):
                do  {
                    countries = try JSONDecoder().decode([Country].self, from: data)
                }
                catch   {
                    fatalError()
                }
            }
        }
        return countries
    }
}
