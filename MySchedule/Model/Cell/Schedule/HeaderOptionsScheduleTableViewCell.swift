//
//  HeaderOptionsScheduleTableViewCell.swift
//  MySchedule
//
//  Created by Nikita Evdokimov on 23.05.2022.
//

import UIKit

class HeaderOptionsScheduleTableViewCell: UITableViewHeaderFooterView {
   
    let headerLabel = UILabel(font: .avenirNext14())
    
    //MARK: - Names of headers
    let headerNamesArray = ["ДАТА И ВРЕМЯ", "ПРЕДМЕТ", "ПРЕПОДАВАТЕЛЬ", "ЦВЕТ", "ПЕРИОД"]

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        headerLabel.textColor = .darkGray
        self.contentView.backgroundColor = .ultraLightGray()
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(section: Int) {
        headerLabel.text = headerNamesArray[section]
    }
    
    func setConstraints() {
        self.addSubview(headerLabel)
        NSLayoutConstraint.activate([
            headerLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            headerLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 1)
        ])
    }
}
