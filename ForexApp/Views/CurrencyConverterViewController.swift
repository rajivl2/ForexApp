//
//  CurrencyConverterViewController.swift
//  ForexApp
//
//  Created by Ford Labs on 31/07/19.
//  Copyright © 2019 Ford Labs. All rights reserved.
//

import UIKit

class CurrencyConverterViewController: UIViewController {

    var appName: UILabel = {
        let name = UILabel()
        name.text = "Currency Converter"
        name.font = UIFont.boldSystemFont(ofSize: 25)
        name.textAlignment = .center
        return name
    }()
    
    var fromLabel: UILabel = {
        let name = UILabel()
        name.text = "From: "
        //name.font = UIFont.boldSystemFont(ofSize: 25)
        name.textAlignment = .center
        return name
    }()
    
    var toLabel: UILabel = {
        let name = UILabel()
        name.text = "To: "
        //name.font = UIFont.boldSystemFont(ofSize: 25)
        name.textAlignment = .center
        return name
    }()
    
    var amountLabel: UILabel = {
        let name = UILabel()
        name.text = "Amount: "
        //name.font = UIFont.boldSystemFont(ofSize: 25)
        name.textAlignment = .center
        return name
    }()
    
    var resultLabel: UILabel = {
        let name = UILabel()
        //name.text = "Currency Converter"
        name.font = UIFont.boldSystemFont(ofSize: 25)
        name.textAlignment = .center
        return name
    }()
    
    let claculateButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Convert", for: .normal)
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
        to.placeholder = "Enter desired currency "
        return to
    }()
    
    let amount: UITextField = {
        let to = UITextField()
        to.placeholder = "Enter Amount "
        return to
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.isNavigationBarHidden = false
        self.view.backgroundColor = .white
        
        setupViews()
        
    }
    
    func setupViews(){
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
            make.width.equalTo(100)
        }
        
        self.view.addSubview(toLabel)
        toLabel.snp.makeConstraints { (make) in
            make.top.equalTo(fromLabel.snp.bottom).offset(30)
            make.left.equalToSuperview().offset(10)
            make.width.equalTo(100)
        }
        
        self.view.addSubview(amountLabel)
        amountLabel.snp.makeConstraints { (make) in
            make.top.equalTo(toLabel.snp.bottom).offset(30)
            make.left.equalToSuperview().offset(10)
            make.width.equalTo(100)
        }
        
        self.view.addSubview(claculateButton)
        claculateButton.snp.makeConstraints { (make) in
            make.top.equalTo(amountLabel.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
            make.width.equalTo(100)
        }
        
        self.view.addSubview(resultLabel)
        resultLabel.snp.makeConstraints { (make) in
            make.top.equalTo(claculateButton.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
            make.width.equalTo(500)
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
        
        self.view.addSubview(amount)
        amount.snp.makeConstraints { (make) in
            make.top.equalTo(toText.snp.bottom).offset(30)
            make.left.equalTo(amountLabel.snp.right).offset(10)
            make.width.equalTo(200)
        }
        
        claculateButton.addTarget(self, action: #selector(claculateButtonTapped), for: .touchUpInside)
    }
    
    @objc func claculateButtonTapped(){
        let currencyConVM = CurrencyConverterViewModel()
        let from = self.fromtext.text ?? ""
        let to = self.toText.text ?? ""
        let amountText = self.amount.text ?? ""
        let amountAsDouble = Double(amountText)
        let amount = amountAsDouble ?? 0.0
        var fromStr = ""
        var toStr = ""
        currencyConVM.getConvertedCurrency(from: from, to: to, amount: amount) { (data, error) in
            DispatchQueue.main.async {
                if data != nil {
                    var result = 0.0
                    result = data?.result ?? 0.0
                    fromStr = String(amount) + " " + from
                    toStr = String(result) + " " + to
                    self.resultLabel.text = fromStr + " = " + toStr
                } else {
                    self.resultLabel.text = "Not valid request. Try Again !"
                }
            }
            
        }
    }
}
