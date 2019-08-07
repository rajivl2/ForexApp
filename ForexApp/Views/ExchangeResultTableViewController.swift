//
//  ExchangeResultTableViewController.swift
//  ForexApp
//
//  Created by Ford Labs on 31/07/19.
//  Copyright © 2019 Ford Labs. All rights reserved.
//

import UIKit

class ExchangeResultTableViewController: UITableViewController {

    var results: ExchangeRateResult?
    var currencies = [String]()
    var ratesValues = [Double]()
    var fromCurrency: String?
    var toCurrencies: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor(red: 120/255, green: 150/255, blue: 200/255, alpha: 1)
        //self.tableView.backgroundColor = UIColor(patternImage: UIImage(named: "BG1")!)
        
        tableView.register(DetailsTableViewCell.self, forCellReuseIdentifier: "cell")
        self.navigationController?.isNavigationBarHidden = false
        
        getExchangeRates()
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let countOfResult = results?.rates.count ?? 0
        return countOfResult
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? DetailsTableViewCell else { fatalError("Some Error")}
        
        var rates = [String?: Double?]()
        rates = results!.rates
        
        for (key,value) in rates{
            currencies.append(key!)
            ratesValues.append(value!)
        }
        
        var rateValue = 0.0
        rateValue = self.ratesValues[indexPath.row]
        cell.currencyLabel.text = self.currencies[indexPath.row]
        cell.rateLabel.text = String(rateValue)
        
        return cell
    }

    func getExchangeRates(){
        let exchangeRateVM = ExchangeRateViewModel()
        let from = self.fromCurrency ?? ""
        let to = self.toCurrencies ?? ""
        let exchangeRateVC = ExchangeRateViewController()
        
        exchangeRateVM.getExchangeRates(from: from, to: to) { (data, error) in
            DispatchQueue.main.async {
                if data != nil {
                    self.results = data
                    self.tableView.reloadData()
                } else {
                    exchangeRateVC.errorMessage.text = "Invalid Request !"
                    self.navigationController?.popViewController(animated: true)
                }
            }
            
        }
    }
}
