//
//  CountryCell.swift
//  Lab25Concurrency-Countries
//
//  Created by Juan Ceballos on 12/9/19.
//  Copyright © 2019 Juan Ceballos. All rights reserved.
//

import UIKit

class CountryCell: UITableViewCell   {
    
    @IBOutlet weak var flagImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var capitalLabel: UILabel!
    @IBOutlet weak var populationLabel: UILabel!
    
    var countries = [Country]()
    
    func configureCell(with urlString: String, country: Country)    {
        flagImage.setImage(with: urlString) { result in
            switch result   {
            case .failure:
                DispatchQueue.main.async {
                    self.flagImage.image = UIImage(systemName: "country.fill")
                }
            case .success(let image):
                DispatchQueue.main.async {
                    self.flagImage.image = image
                }
            }

        }
        self.nameLabel.text = "Country: \(country.name)"
        self.capitalLabel.text = "Capital: \(country.capital)"
        self.populationLabel.text = "Population: \(country.population.description)"
    }
}
