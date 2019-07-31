//
//  HomeViewController.swift
//  ForexApp
//
//  Created by Ford Labs on 31/07/19.
//  Copyright © 2019 Ford Labs. All rights reserved.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {

    var appName: UILabel = {
        let name = UILabel()
        name.text = "FOREX"
        name.font = UIFont.boldSystemFont(ofSize: 25)
        name.textAlignment = .center
        return name
    }()
    
    let currencyConverterButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Currency Converter", for: .normal)
        btn.backgroundColor = UIColor.clear
        btn.setTitleColor(.blue, for: .normal)
        return btn
    }()
    
    let currencyRateCalculatorButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Exchange Rate Calculator", for: .normal)
        btn.backgroundColor = UIColor.clear
        btn.setTitleColor(.blue, for: .normal)
        return btn
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.navigationController?.isNavigationBarHidden = false
        
        setUpViews()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }

    func setUpViews() {
        
        self.view.addSubview(appName)
        appName.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(100)
            make.width.equalTo(300)
        }
        
        self.view.addSubview(currencyConverterButton)
        currencyConverterButton.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(350)
            make.width.equalTo(300)
        }
        
        self.view.addSubview(currencyRateCalculatorButton)
        currencyRateCalculatorButton.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(currencyConverterButton.snp.bottom).offset(80)
            make.width.equalTo(300)
        }
        
        currencyConverterButton.addTarget(self, action: #selector(currencyConverterButtonTapped), for: .touchUpInside)
        currencyRateCalculatorButton.addTarget(self, action: #selector(currencyRateCalculatorButtonTapped), for: .touchUpInside)
        
    }
    
    @objc func currencyConverterButtonTapped(){
        let currncyConverterVC = CurrencyConverterViewController()
        self.navigationController?.pushViewController(currncyConverterVC, animated: true)
    }
    
    @objc func currencyRateCalculatorButtonTapped(){
        let exchangeRateVC = ExchangeRateViewController()
        self.navigationController?.pushViewController(exchangeRateVC, animated: true)
    }
}

