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
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
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
        
        //cell.backgroundColor = .green
        
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    func getExchangeRates(){
        let currVM = CurrencyConverterViewModel()
        let from = self.fromCurrency ?? ""
        let to = self.toCurrencies ?? ""
        let exchangeRateVC = ExchangeRateViewController()
        
        currVM.getExchangeRates(from: from, to: to) { (data, error) in
            DispatchQueue.main.async {
                if data != nil {
                    self.results = data
                    self.tableView.reloadData()
                } else {
                    //print(error?.localizedDescription)
                    exchangeRateVC.errorMessage.text = "Invalid Request !"
                    self.navigationController?.popViewController(animated: true)
                    //self.navigationController?.pushViewController(self.exchangeRateVC, animated: true)
                }
            }
            
        }
    }
}
