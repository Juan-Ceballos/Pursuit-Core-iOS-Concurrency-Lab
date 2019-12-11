//
//  DetailedCountriesViewController.swift
//  Lab25Concurrency-Countries
//
//  Created by Juan Ceballos on 12/9/19.
//  Copyright © 2019 Juan Ceballos. All rights reserved.
//

import UIKit

class DetailedCountriesViewController: UIViewController {

    @IBOutlet weak var detailedFlagImage: UIImageView!
    @IBOutlet weak var detailedPopulatiobLabel: UILabel!
    @IBOutlet weak var detailedNameLabel: UILabel!
    @IBOutlet weak var detailedCapitalLabel: UILabel!
    
    var countries: Country?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        detailedFlagImage.setImage(with: countries?.flagURL ?? "") { [weak self] (result) in
            switch result   {
            case .failure(let appError):
                print(appError)
            case .success(let data):
                DispatchQueue.main.async {
                    self?.detailedFlagImage.image = data
                }
            }
        }
        self.detailedPopulatiobLabel.text = "Population: \(countries?.population.description ?? "")"
        self.detailedNameLabel.text = "Country: \(countries?.name ?? "")"
        self.detailedCapitalLabel.text = "Capital: \(countries?.capital ?? "")"
    }
    
}
