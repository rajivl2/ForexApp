//
//  CurrencyConverterViewController.swift
//  ForexApp
//
//  Created by Ford Labs on 31/07/19.
//  Copyright © 2019 Ford Labs. All rights reserved.
//

import UIKit

class CurrencyConverterViewController: UIViewController,  UIPickerViewDelegate, UIPickerViewDataSource {

    var currencies = ["BDT","BGN","BIF","CAD","USD","INR"]
    var selectedOriginCur: String?
    var selectedDestinationCur: String?
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
    
    var originCurPicker: UIPickerView = {
        let origin = UIPickerView()
        origin.translatesAutoresizingMaskIntoConstraints = false
        return origin
    } ()
    
    var destinationCurPicker: UIPickerView = {
        let destination = UIPickerView()
        destination.translatesAutoresizingMaskIntoConstraints = false
        return destination
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.isNavigationBarHidden = false
        self.view.backgroundColor = .white
        
        //getCurrencies()
        
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
        
        self.view.addSubview(originCurPicker)
        originCurPicker.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(100)
            make.left.equalTo(fromLabel.snp.right).offset(10)
            make.width.equalTo(160)
        }
        
        self.view.addSubview(toLabel)
        toLabel.snp.makeConstraints { (make) in
            make.top.equalTo(originCurPicker.snp.bottom).offset(30)
            make.left.equalToSuperview().offset(10)
            make.width.equalTo(100)
        }
        
        self.view.addSubview(destinationCurPicker)
        destinationCurPicker.snp.makeConstraints { (make) in
            make.top.equalTo(originCurPicker.snp.bottom)
            make.left.equalTo(toLabel.snp.right).offset(10)
            make.width.equalTo(160)
        }
        
        self.view.addSubview(amountLabel)
        amountLabel.snp.makeConstraints { (make) in
            make.top.equalTo(destinationCurPicker.snp.bottom).offset(30)
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
        
        
        
        
        
        self.view.addSubview(amount)
        amount.snp.makeConstraints { (make) in
            make.top.equalTo(destinationCurPicker.snp.bottom).offset(30)
            make.left.equalTo(amountLabel.snp.right).offset(10)
            make.width.equalTo(200)
        }
        
        self.originCurPicker.delegate = self
        self.destinationCurPicker.delegate = self
        
        claculateButton.addTarget(self, action: #selector(claculateButtonTapped), for: .touchUpInside)
    }
    
    @objc func claculateButtonTapped(){
        let currencyConVM = CurrencyConverterViewModel()
        let from = selectedOriginCur ?? ""
        let to = selectedDestinationCur ?? ""
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
    
//    func getCurrencies(){
//        self.currencies = ["BDT","BGN","BIF","CAD","USD","INR"]
//    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.currencies.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.currencies[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == self.originCurPicker {
            self.selectedOriginCur = self.currencies[row]
        } else {
            self.selectedDestinationCur = self.currencies[row]
        }
    }
}
