//
//  ViewController.swift
//  Lab25Concurrency-Countries
//
//  Created by Juan Ceballos on 12/9/19.
//  Copyright © 2019 Juan Ceballos. All rights reserved.
//

import UIKit

class CountriesViewController: UIViewController {

    @IBOutlet weak var countriesTableView: UITableView!
    
    var countries = [Country]() {
        didSet  {
            countriesTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countriesTableView.dataSource = self
    }
}

extension CountriesViewController: UITableViewDataSource    {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)  {
        guard let countryCell = countriesTableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath) as? CountryCell
            else    {
                fatalError()
        }
        
        let country = countries[indexPath.row]
        countryCell.configureCell(with: "https://restcountries.eu/rest/v2/name/united")
        
    }
}

