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
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        return btn
    }()
    
    let currencyRateCalculatorButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Exchange Rate Calculator", for: .normal)
        btn.backgroundColor = UIColor.clear
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        return btn
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 120/255, green: 150/255, blue: 200/255, alpha: 1)
        //self.view.backgroundColor = UIColor(patternImage: UIImage(named: "BG1")!)
        
        self.navigationController?.isNavigationBarHidden = true
        
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
            make.centerY.equalToSuperview().offset(-40)
            make.width.equalTo(300)
        }
        
        self.view.addSubview(currencyRateCalculatorButton)
        currencyRateCalculatorButton.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(40)
            make.width.equalTo(300)
        }
        
        currencyConverterButton.addTarget(self, action: #selector(currencyConverterButtonTapped), for: .touchUpInside)
        currencyRateCalculatorButton.addTarget(self, action: #selector(currencyRateCalculatorButtonTapped), for: .touchUpInside)
        
    }
    
    @objc func currencyConverterButtonTapped(){
        let currncyConverterVC = CurrencyConverterViewController()
        currncyConverterVC.getSupportedCurresciesForPicker()
        self.navigationController?.pushViewController(currncyConverterVC, animated: true)
    }
    
    @objc func currencyRateCalculatorButtonTapped(){
        let exchangeRateVC = ExchangeRateViewController()
        self.navigationController?.pushViewController(exchangeRateVC, animated: true)
    }
}

