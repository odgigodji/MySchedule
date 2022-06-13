//
//  ColorScheduleTableViewCell.swift
//  MySchedule
//
//  Created by Nikita Evdokimov on 25.05.2022.
//

import UIKit

class ColorTableViewCell: UITableViewCell {

    let backgroundViewCell: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setConstrains()
        backgroundColor = .clear
        
        //MARK: - off selection cells
        self.selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //F6CDC4 - red
    //F6D6C4 - orange
    //F6E9C4 - yellow
    //DFF6C4 - green
    //C4F6F2 - blue
    //C4ECF6 - dark blue
    //D0C4F6 - violet
    
    func configure(indexPath: IndexPath, rowHexColors: [String]) {
        switch indexPath.section {
            case 0: backgroundViewCell.backgroundColor = UIColor().colorFromHex(rowHexColors[0])
            case 1: backgroundViewCell.backgroundColor = UIColor().colorFromHex(rowHexColors[1])
            case 2: backgroundViewCell.backgroundColor = UIColor().colorFromHex(rowHexColors[2])
            case 3: backgroundViewCell.backgroundColor = UIColor().colorFromHex(rowHexColors[3])
            case 4: backgroundViewCell.backgroundColor = UIColor().colorFromHex(rowHexColors[4])
            case 5: backgroundViewCell.backgroundColor = UIColor().colorFromHex(rowHexColors[5])
            default: backgroundViewCell.backgroundColor = UIColor().colorFromHex(rowHexColors[6])
        }
    }
    
    //MARK: - Set constraints for subviews on cell
    func setConstrains() {
        self.addSubview(backgroundViewCell)
        NSLayoutConstraint.activate([
            backgroundViewCell.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundViewCell.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            backgroundViewCell.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            backgroundViewCell.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -1)
        ])
    }
}

