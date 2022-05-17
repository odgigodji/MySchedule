//
//  ScheduleTableViewCell.swift
//  MySchedule
//
//  Created by Nikita Evdokimov on 16.05.2022.
//

import UIKit

class ScheduleTableViewCell: UITableViewCell {
    
    let lessonName : UILabel = {
        let label = UILabel()
        label.text = "programming"
        label.textColor = .black
        label.font = UIFont(name: "Avenir Next Demi Bold", size: 20)
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .yellow
        return label
    }()
    
    let teacherName : UILabel = {
        let label = UILabel()
        label.text = "Antonov"
        label.textColor = .black
        label.font = UIFont(name: "Avenir Next", size: 20)
        label.textAlignment = .right
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .yellow
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstrains() {
        
    }
}
