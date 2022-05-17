//
//  ScheduleTableViewCell.swift
//  MySchedule
//
//  Created by Nikita Evdokimov on 16.05.2022.
//

import UIKit

class ScheduleTableViewCell: UITableViewCell {
    
    let lessonName = UILabel(text: "Programming", font: UIFont(name: "Avenir Next Demi Bold", size: 20), alignment: .left)
    let teacherName = UILabel(text: "Antonov Anton", font: UIFont(name: "Avenir Next", size: 20), alignment: .right)
    let lessonTime = UILabel(text: "08:00", font: UIFont(name: "Avenir Next", size: 20), alignment: .left)
    let typeLabel = UILabel(text: "Type", font: UIFont(name: "Avenir Next", size: 14), alignment: .right)
    let lessonType = UILabel(text: "Lection", font: UIFont(name: "Avenir Next Demi Bold", size: 14), alignment: .left)
    let buildingLabel = UILabel(text: "Корпус:", font: UIFont(name: "Avenir Next Demi Bold", size: 14), alignment: .right)
    let lessonBuilding = UILabel(text: "1", font: UIFont(name: "Avenir Next", size: 14), alignment: .left)
    let audLabel = UILabel(text: "Аудитория", font: UIFont(name: "Avenir Next", size: 14), alignment: .right)
    let lessonAud = UILabel(text: "101", font: UIFont(name: "Avenir Next", size: 14), alignment: .left)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) { [self] in
            setConstrains()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstrains() {
        let topStackView = UIStackView(arrangedSubviews: [lessonName, teacherName], axis: .horizontal, spacing: 10, distribution: .fillEqually)
        let bottomStackView = UIStackView(arrangedSubviews: [typeLabel, lessonTime, lessonType, buildingLabel, lessonBuilding, audLabel, lessonAud], axis: .horizontal, spacing: 5, distribution: .fillProportionally)
        
        self.addSubview(topStackView)
        NSLayoutConstraint.activate([
            topStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            topStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            topStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            topStackView.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        self.addSubview(lessonTime)
        NSLayoutConstraint.activate([
            lessonTime.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            lessonTime.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            lessonTime.widthAnchor.constraint(equalToConstant: 100),
            lessonTime.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        self.addSubview(bottomStackView)
        NSLayoutConstraint.activate([
            bottomStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            bottomStackView.leadingAnchor.constraint(equalTo: lessonTime.trailingAnchor, constant: 5),
            bottomStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            bottomStackView.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
}
