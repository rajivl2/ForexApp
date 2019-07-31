//
//  ExchangeRateViewController.swift
//  ForexApp
//
//  Created by Ford Labs on 31/07/19.
//  Copyright © 2019 Ford Labs. All rights reserved.
//

import UIKit

class ExchangeRateViewController: UIViewController {

    var results: ExchangeRateResult?
    
    var appName: UILabel = {
        let name = UILabel()
        name.text = "Exchange Rate Calculator"
        name.font = UIFont.boldSystemFont(ofSize: 25)
        name.textAlignment = .center
        return name
    }()
    
    var fromLabel: UILabel = {
        let name = UILabel()
        name.text = "Base Currency: "
        //name.font = UIFont.boldSystemFont(ofSize: 25)
        name.textAlignment = .center
        return name
    }()
    
    var toLabel: UILabel = {
        let name = UILabel()
        name.text = "Target Currencies:  "
        //name.font = UIFont.boldSystemFont(ofSize: 25)
        name.textAlignment = .center
        return name
    }()
    
    let exchangeRateButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Get Exchange Rates", for: .normal)
        btn.backgroundColor = UIColor.clear
        btn.setTitleColor(.blue, for: .normal)
        return btn
    }()
    
    let fromtext: UITextField = {
        let from = UITextField()
        from.placeholder = "Enter base currency "
        return from
    } ()
    let toText: UITextField = {
        let to = UITextField()
        to.placeholder = "Separated by come with no space "
        return to
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.isNavigationBarHidden = false
        self.view.backgroundColor = .white
        
        setUpViews()
    }
    
    func setUpViews(){
        
        self.view.addSubview(appName)
        appName.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(100)
            make.width.equalTo(300)
        }
        
        self.view.addSubview(fromLabel)
        fromLabel.snp.makeConstraints { (make) in
            make.top.equalTo(appName.snp.bottom).offset(60)
            make.left.equalToSuperview().offset(10)
            make.width.equalTo(200)
        }
        
        self.view.addSubview(toLabel)
        toLabel.snp.makeConstraints { (make) in
            make.top.equalTo(fromLabel.snp.bottom).offset(30)
            make.left.equalToSuperview().offset(10)
            make.width.equalTo(200)
        }
        
        self.view.addSubview(exchangeRateButton)
        exchangeRateButton.snp.makeConstraints { (make) in
            make.top.equalTo(toLabel.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
        }
        
        self.view.addSubview(fromtext)
        fromtext.snp.makeConstraints { (make) in
            make.top.equalTo(appName.snp.bottom).offset(60)
            make.left.equalTo(fromLabel.snp.right).offset(10)
            make.width.equalTo(200)
        }
        
        self.view.addSubview(toText)
        toText.snp.makeConstraints { (make) in
            make.top.equalTo(fromtext.snp.bottom).offset(30)
            make.left.equalTo(toLabel.snp.right).offset(10)
            make.width.equalTo(200)
        }
        
        exchangeRateButton.addTarget(self, action: #selector(exchangeRateButtonTapped), for: .touchUpInside)
    }
    
    @objc func exchangeRateButtonTapped(){
        
        let tableVC = ExchangeResultTableViewController()
        
        tableVC.fromCurrency = self.fromtext.text
        tableVC.toCurrencies = self.toText.text
        
        self.navigationController?.pushViewController(tableVC, animated: true)

    }
}
