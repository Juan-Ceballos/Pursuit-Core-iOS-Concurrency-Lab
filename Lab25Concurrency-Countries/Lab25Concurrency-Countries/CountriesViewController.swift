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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countriesTableView.dataSource = self
    }
}

extension CountriesViewController: UITableViewDataSource    {
    func tableView(_tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_tableView: UITableView, cellForRowAt indexPath: IndexPath)  {
        
    }
}

