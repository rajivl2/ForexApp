//
//  ExchangeRateViewController.swift
//  ForexApp
//
//  Created by Ford Labs on 31/07/19.
//  Copyright © 2019 Ford Labs. All rights reserved.
//

import UIKit

class ExchangeRateViewController: UIViewController {

    weak var delegate: ExchangeRateViewControllerDelegate?
    var results: ExchangeRateResult?
    
    private let appName: UILabel = {
        let name = UILabel()
        name.text = "Exchange Rate Calculator"
        name.font = UIFont.boldSystemFont(ofSize: 25)
        name.textAlignment = .center
        return name
    }()
    
    private let fromLabel: UILabel = {
        let name = UILabel()
        name.text = "Base Currency: "
        name.font = UIFont.boldSystemFont(ofSize: 20)
        name.textAlignment = .center
        return name
    }()
    
    private let toLabel: UILabel = {
        let name = UILabel()
        name.text = "Target Currencies: "
        name.font = UIFont.boldSystemFont(ofSize: 20)
        name.textAlignment = .center
        return name
    }()
    
    private let exchangeRateButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Get Exchange Rates", for: .normal)
        btn.backgroundColor = UIColor.blue
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        return btn
    }()
    
    private let fromtext: UITextField = {
        let from = UITextField()
        from.placeholder = "like EUR"
        return from
    } ()
    private let toText: UITextField = {
        let to = UITextField()
        to.placeholder = "like INR,USD"
        return to
    }()
    
    let errorMessage: UILabel = {
        let msg = UILabel()
        msg.font = UIFont.boldSystemFont(ofSize: 25)
        msg.textAlignment = .center
        return msg
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.isNavigationBarHidden = false
        self.view.backgroundColor = UIColor(red: 120/255, green: 150/255, blue: 200/255, alpha: 1)
        //self.view.backgroundColor = UIColor(patternImage: UIImage(named: "BG1")!)
        
        setUpViews()
        
        addDoneButtonOnKeyboard()
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
        
        self.view.addSubview(fromtext)
        fromtext.snp.makeConstraints { (make) in
            make.top.equalTo(appName.snp.bottom).offset(60)
            make.left.equalTo(fromLabel.snp.right).offset(10)
            make.right.equalToSuperview().offset(-10)
        }
        
        self.view.addSubview(toLabel)
        toLabel.snp.makeConstraints { (make) in
            make.top.equalTo(fromLabel.snp.bottom).offset(30)
            make.left.equalToSuperview().offset(10)
            make.width.equalTo(200)
        }
        
        self.view.addSubview(toText)
        toText.snp.makeConstraints { (make) in
            make.top.equalTo(fromtext.snp.bottom).offset(30)
            make.left.equalTo(toLabel.snp.right).offset(10)
            make.right.equalToSuperview().offset(-10)
        }
        
        self.view.addSubview(exchangeRateButton)
        exchangeRateButton.snp.makeConstraints { (make) in
            make.top.equalTo(toLabel.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
        }
        
        self.view.addSubview(errorMessage)
        errorMessage.snp.makeConstraints { (make) in
            make.top.equalTo(exchangeRateButton.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
        }
        
        exchangeRateButton.addTarget(self, action: #selector(exchangeRateButtonTapped), for: .touchUpInside)
    }
    
    @objc func exchangeRateButtonTapped(){
        
        guard let fromCurrency = self.fromtext.text,
            fromCurrency.count == 3 else {
            displayErrorMessage(message: "Please enter valid currency code !")
            return
        }
        
        
        
        self.delegate?.exchangeRateButtonTapped(fromCurrency: fromCurrency, toCurrencies: self.toText.text ?? "")

    }
    
    func displayErrorMessage(message:String) {
        let alertView = UIAlertController(title: "Error!", message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in
        }
        alertView.addAction(OKAction)
        if let presenter = alertView.popoverPresentationController {
            presenter.sourceView = self.view
            presenter.sourceRect = self.view.bounds
        }
        self.present(alertView, animated: true, completion:nil)
    }
    
    func addDoneButtonOnKeyboard(){
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar.barStyle = .default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))
        
        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        fromtext.inputAccessoryView = doneToolbar
        toText.inputAccessoryView = doneToolbar
    }
    
    @objc func doneButtonAction(){
        fromtext.resignFirstResponder()
        toText.resignFirstResponder()
    }
    
}

protocol ExchangeRateViewControllerDelegate : class {
    func exchangeRateButtonTapped(fromCurrency: String, toCurrencies: String)
}
