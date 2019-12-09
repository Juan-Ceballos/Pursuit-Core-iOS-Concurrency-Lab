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
    @IBOutlet weak var population: UILabel!
    
    func configureCell(with urlString: String)    {
        flagImage.setImage(with: urlString) { result in
            switch result   {
            case .failure:
                self.flagImage.image = UIImage(systemName: "country.fill")
            case .success(let image):
                self.flagImage.image = image
            }
        }
    }
    
}
