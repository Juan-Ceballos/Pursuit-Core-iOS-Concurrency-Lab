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
    @IBOutlet weak var countrySearchBar: UISearchBar!
    
    var countries = [Country]() {
        didSet  {
            DispatchQueue.main.async{
                self.countriesTableView.reloadData()}
        }
    }
    
    var searchQuery = ""    {
        didSet  {
            CountryAPI.getCountries { [weak self] (result) in
                switch result   {
                case .failure(let appError):
                    print("appError: \(appError)")
                case .success(let data):
                    self?.countries = data.filter   {
                        $0.lowercasedName.contains(String(self?.searchQuery.lowercased() ?? ""))}
                }
            }
        }
    }
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countriesTableView.dataSource = self
        loadCountries()
        countriesTableView.delegate = self
        countrySearchBar.delegate = self
    }
    
    func loadCountries()    {
        CountryAPI.getCountries { [weak self] (result) in
            switch result   {
            case .failure(let appError):
                print("appError: \(appError)")
            case .success(let data):
                self?.countries = data
            }
        }
    }
}

extension CountriesViewController: UITableViewDataSource    {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell  {
        guard let countryCell = countriesTableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath) as? CountryCell
            else    {
                fatalError()
        }
        
        let country = countries[indexPath.row]
        countryCell.configureCell(with: country.flagURL, country: country)
        return countryCell
        }
        
    }

extension CountriesViewController: UITableViewDelegate  {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}

extension CountriesViewController: UISearchBarDelegate  {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        countrySearchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else{
            loadCountries()
            return
        }
        searchQuery = searchText
    }
}

