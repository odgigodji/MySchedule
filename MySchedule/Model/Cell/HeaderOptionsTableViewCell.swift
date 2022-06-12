//
//  HeaderOptionsTableViewCell.swift
//  MySchedule
//
//  Created by Nikita Evdokimov on 23.05.2022.
//

import UIKit

class HeaderOptionsTableViewCell: UITableViewHeaderFooterView {
   
    let headerLabel = UILabel(font: .avenirNext14())
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        headerLabel.textColor = .darkGray
        self.contentView.backgroundColor = .ultraLightGray()
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(nameArray: [String], section: Int) {
        headerLabel.text = nameArray[section]
    }
    
    func setConstraints() {
        self.addSubview(headerLabel)
        NSLayoutConstraint.activate([
            headerLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            headerLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 1)
        ])
    }
}
