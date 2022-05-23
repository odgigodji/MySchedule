//
//  HeaderOptionsScheduleTableViewCell.swift
//  MySchedule
//
//  Created by Nikita Evdokimov on 23.05.2022.
//

import UIKit

class HeaderOptionsScheduleTableViewCell: UITableViewHeaderFooterView {
   
    let headerLabel = UILabel(text: "HEADER", font: .avenirNext14())
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstraints() {
        self.addSubview(headerLabel)
        NSLayoutConstraint.activate([
            headerLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            headerLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)
        ])
    }
}
