//
//  CurrencyConverterViewController.swift
//  ForexApp
//
//  Created by Ford Labs on 31/07/19.
//  Copyright © 2019 Ford Labs. All rights reserved.
//

import UIKit

class CurrencyConverterViewController: UIViewController,  UIPickerViewDelegate, UIPickerViewDataSource {

    private var currencies = [String]()
    
    private var supportedCurrencies = [String: String]()
    
    private let fromCurrencyPicker: UIPickerView = {
        let picker = UIPickerView()
        picker.accessibilityIdentifier = "From Currency Picker"
        return picker
    }()
    private let toCurrencyPicker: UIPickerView = {
        let picker = UIPickerView()
        picker.accessibilityIdentifier = "To Currency Picker"
        return picker
    }()
    
    private let appName: UILabel = {
        let name = UILabel()
        name.text = "Currency Converter"
        name.font = UIFont.boldSystemFont(ofSize: 25)
        name.textAlignment = .center
        return name
    }()
    
    private let fromLabel: UILabel = {
        let name = UILabel()
        name.text = "From "
        name.font = UIFont.boldSystemFont(ofSize: 20)
        name.textColor = .black
        name.textAlignment = .left
        return name
    }()
    
    private let toLabel: UILabel = {
        let name = UILabel()
        name.text = "To "
        name.font = UIFont.boldSystemFont(ofSize: 20)
        name.textColor = .black
        name.textAlignment = .left
        return name
    }()
    
    private let amountLabel: UILabel = {
        let name = UILabel()
        name.text = "Amount "
        name.font = UIFont.boldSystemFont(ofSize: 20)
        name.textColor = .black
        name.textAlignment = .left
        return name
    }()
    
    private let resultLabel: UILabel = {
        let name = UILabel()
        name.textColor = .black
        name.font = UIFont.boldSystemFont(ofSize: 25)
        name.textAlignment = .center
        name.accessibilityIdentifier = "Result Label"
        return name
    }()
    
    private let claculateButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Convert", for: .normal)
        btn.backgroundColor = UIColor.blue
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        btn.layer.cornerRadius = 4
        return btn
    }()
    
    private let fromtext: UITextField = {
        let from = UITextField()
        from.placeholder = "Enter base currency"
        from.textColor = .black
        return from
    } ()
    private let toText: UITextField = {
        let to = UITextField()
        to.placeholder = "Enter desired currency"
        to.textColor = .black
        return to
    }()
    
    private let amount: UITextField = {
        let to = UITextField()
        to.placeholder = "Enter Amount"
        to.textColor = .black
        return to
    }()
    
    let currencyConVM = CurrencyConverterViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.isNavigationBarHidden = false
        self.view.backgroundColor = UIColor(red: 120/255, green: 150/255, blue: 200/255, alpha: 1)
        //self.view.backgroundColor = UIColor(patternImage: UIImage(named: "BG1")!)
        navigationController?.navigationBar.barTintColor = UIColor(red: 120/255, green: 150/255, blue: 200/255, alpha: 1)
        navigationController?.navigationBar.tintColor = UIColor.black
        
        setupViews()
        
        setToolBarForCurrencyPicker()
        
        fromtext.inputView = fromCurrencyPicker
        toText.inputView = toCurrencyPicker
        
        fromCurrencyPicker.delegate = self
        toCurrencyPicker.delegate = self
        
        addDoneButtonOnKeyboard()
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
            make.left.equalToSuperview().offset(20)
            make.width.equalTo(100)
        }
        
        self.view.addSubview(fromtext)
        fromtext.snp.makeConstraints { (make) in
            make.top.equalTo(appName.snp.bottom).offset(60)
            make.left.equalTo(fromLabel.snp.right).offset(10)
            make.right.equalToSuperview().offset(-10)
        }
        
        self.view.addSubview(toLabel)
        toLabel.snp.makeConstraints { (make) in
            make.top.equalTo(fromLabel.snp.bottom).offset(30)
            make.left.equalToSuperview().offset(20)
            make.width.equalTo(100)
        }
        
        self.view.addSubview(toText)
        toText.snp.makeConstraints { (make) in
            make.top.equalTo(fromtext.snp.bottom).offset(30)
            make.left.equalTo(toLabel.snp.right).offset(10)
            make.right.equalToSuperview().offset(-10)
        }
        
        self.view.addSubview(amountLabel)
        amountLabel.snp.makeConstraints { (make) in
            make.top.equalTo(toLabel.snp.bottom).offset(30)
            make.left.equalToSuperview().offset(20)
            make.width.equalTo(100)
        }
        
        self.view.addSubview(amount)
        amount.snp.makeConstraints { (make) in
            make.top.equalTo(toText.snp.bottom).offset(30)
            make.left.equalTo(amountLabel.snp.right).offset(10)
            make.right.equalToSuperview().offset(-10)
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
        
        claculateButton.addTarget(self, action: #selector(claculateButtonTapped), for: .touchUpInside)
    }
    
    @objc func claculateButtonTapped(){
        
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
        let currency = self.currencies[row].prefix(3)
        if pickerView == fromtext.inputView {
            self.fromtext.text = String(currency)
        } else {
            self.toText.text = String(currency)
        }
    }
    
    func setToolBarForCurrencyPicker(){
        //ToolBar
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneCurrencyPicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelCurrencyPicker));
        
        toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
        
        fromtext.inputAccessoryView = toolbar
        toText.inputAccessoryView = toolbar
    }
    
    @objc func doneCurrencyPicker(){
        self.view.endEditing(true)
    }
    
    @objc func cancelCurrencyPicker(){
        self.view.endEditing(true)
    }
    
    func getSupportedCurresciesForPicker(){
        currencyConVM.getSupportedCurrencies { (result, error) in
            DispatchQueue.main.async {
                if result != nil {
                    self.supportedCurrencies = result?.symbols ?? ["":""]
                    self.populatePickerData()
                }
            }
        }
    }
    
    func populatePickerData(){
        for (key,value) in self.supportedCurrencies {
            self.currencies.append("\(key) - \(value)")
        }
        
        self.currencies.sort { ($0 < $1)}
    }
    
    func addDoneButtonOnKeyboard(){
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar.barStyle = .default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))
        
        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        amount.inputAccessoryView = doneToolbar
    }
    
    @objc func doneButtonAction(){
        amount.resignFirstResponder()
    }
}
