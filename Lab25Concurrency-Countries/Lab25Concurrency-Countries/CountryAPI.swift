//
//  CountryAPI.swift
//  Lab25Concurrency-Countries
//
//  Created by Juan Ceballos on 12/9/19.
//  Copyright © 2019 Juan Ceballos. All rights reserved.
//

import Foundation

struct CountryAPI   {
    
    static func getCountries(completion: @escaping (Result<[Country], AppError>) -> ())  {
        let urlString = "https://restcountries.eu/rest/v2/name/united"

        NetworkHelper.shared.performDataTask(with: urlString) { (result) in
            switch result   {
            case .failure(let appError):
                completion(.failure(.networkClientError(appError)))
                print("App Error: \(appError)")
            case .success(let data):
                do  {
                    let countries = try JSONDecoder().decode([Country].self, from: data)
                    completion(.success(countries))
                }
                catch   {
                    completion(.failure(.decodingError(error)))
                }
            }
        }
    }
}
