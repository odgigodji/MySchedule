//
//  ScheduleColorsVC.swift
//  MySchedule
//
//  Created by Nikita Evdokimov on 24.05.2022.
//

import UIKit

class ScheduleColorsVC : UITableViewController {
    
    private let idOptionsColorCell = "idOptionsColorCell"
    private let idOptionsColorHeader = "idOptionsColorHeader"
    
    let headerNamesArray = ["RED", "ORANGE", "YELLOW", "GREEN", "BLUE", "DEEP BLUE", "PURPLE"]
    let rowHexColors = ["F6CDC4", "F6D6C4", "F6E9C4", "DFF6C4", "C4F6F2", "C4ECF6", "D0C4F6" ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: - style for Color Schedule TableVC
        title = "Colors Schedule"
        tableView.backgroundColor = .ultraLightGray()
        tableView.separatorStyle = .none
        
        //MARK: - delegate, dataSource and register for Cell and headers
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ColorTableViewCell.self, forCellReuseIdentifier: idOptionsColorCell)
        tableView.register(HeaderOptionsTableViewCell.self, forHeaderFooterViewReuseIdentifier: idOptionsColorHeader)
    }
    
    //MARK: - num of Section
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    
    //MARK: - num of row in section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idOptionsColorCell, for: indexPath) as! ColorTableViewCell
        cell.configure(indexPath: indexPath, rowHexColors: rowHexColors)
        return cell
    }
    
    //MARK: - set height of the cell
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    //MARK: - set header in table view
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: idOptionsColorHeader) as! HeaderOptionsTableViewCell
        header.configure(nameArray: headerNamesArray, section: section)
        return header
    }
    
    //MARK: - heightForHeaderInSection
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        40
    }
    
    //MARK: - didSelectRowAt
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0: setColor(hexColor: rowHexColors[0])
        case 1: setColor(hexColor: rowHexColors[1])
        case 2: setColor(hexColor: rowHexColors[2])
        case 3: setColor(hexColor: rowHexColors[3])
        case 4: setColor(hexColor: rowHexColors[4])
        case 5: setColor(hexColor: rowHexColors[5])
        case 6: setColor(hexColor: rowHexColors[6])
        default:
            setColor(hexColor: "FFFFFF")
        }
    }
    
    private func setColor(hexColor: String) {
        //MARK: - view controller[1] is ScheduleOptions
        let scheduleOptions = self.navigationController?.viewControllers[1] as? ScheduleOptionsTableVC
        scheduleOptions?.hexColorCell = hexColor
        scheduleOptions?.tableView.reloadRows(at: [[3, 0]], with: .none)
        self.navigationController?.popViewController(animated: true)
    }
}
