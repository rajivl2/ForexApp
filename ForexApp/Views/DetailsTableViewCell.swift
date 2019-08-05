//
//  DetailsTableViewCell.swift
//  ForexApp
//
//  Created by Ford Labs on 31/07/19.
//  Copyright © 2019 Ford Labs. All rights reserved.
//

import UIKit

class DetailsTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor(red: 120/255, green: 150/255, blue: 200/255, alpha: 1)
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var currencyLabel: UILabel = {
        let name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    var rateLabel: UILabel = {
        let price = UILabel()
        price.translatesAutoresizingMaskIntoConstraints = false
        return price
    }()
    
    func setUpViews(){
        addSubview(currencyLabel)
        currencyLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10)
            make.width.equalTo(130)
            make.left.equalTo(20)
        }
        
        addSubview(rateLabel)
        rateLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10)
            make.left.equalTo(currencyLabel.snp.right)
            make.width.equalTo(130)
        }

    }
}
