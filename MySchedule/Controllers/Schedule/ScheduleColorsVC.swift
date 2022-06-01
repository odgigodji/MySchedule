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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: - style for Color Schedule TableVC
        title = "Colors Schedule"
        tableView.backgroundColor = .ultraLightGray()
        tableView.separatorStyle = .none
//        tableView.bounces = false
        
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
        cell.configure(indexPath: indexPath)
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
        case 0: setColor(hexColor: "BE2813")
        case 1: setColor(hexColor: "F07F5A")
        case 2: setColor(hexColor: "F3AF22")
        case 3: setColor(hexColor: "467C24")
        case 4: setColor(hexColor: "2D7FC1")
        case 5: setColor(hexColor: "1A4766")
        case 6: setColor(hexColor: "2D038F")
        default:
            setColor(hexColor: "FFFFFF")
        }
    }
    
    private func setColor(hexColor: String) {
        //MARK: - view controller[1] is ScheduleOptions
        let scheduleOptions = self.navigationController?.viewControllers[1] as? ScheduleOptionsTableVC
        scheduleOptions?.hexColorCell = hexColor
        self.navigationController?.popViewController(animated: true)
    }
}

//popViewController - for comeback to previous VC
