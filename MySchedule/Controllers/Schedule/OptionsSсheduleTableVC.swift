//
//  OptionsScheduleVC.swift
//  MySchedule
//
//  Created by Nikita Evdokimov on 22.05.2022.
//

import UIKit

class OptionsScheduleTableVC : UITableViewController {
    
    let idOptionsScheduleCell = "idOptionsShadowCell"
    let idOptionsScheduleHeader = "idOptionsScheduleHeader"
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Option Schedule"
        tableView.backgroundColor = .ultraLightGray()
        
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(OptionsScheduleTableViewCell.self, forCellReuseIdentifier: idOptionsScheduleCell)
        tableView.register(HeaderOptionsScheduleTableViewCell.self, forHeaderFooterViewReuseIdentifier: idOptionsScheduleHeader)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return 2
        case 1: return 4
        case 2: return 1
        case 3: return 1
        default:
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idOptionsScheduleCell, for: indexPath) as! OptionsScheduleTableViewCell
        cell.configure(indexPath: indexPath)
        return cell
    }
    
    //MARK: - set height of the cell
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    //MARK: - set header in table view
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: idOptionsScheduleHeader) as! HeaderOptionsScheduleTableViewCell
        header.configure(section: section)
        return header
    }
    
    //MARK: - heightForHeaderInSection
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        40
    }
    
    //MARK: - didSelectRowAt
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! OptionsScheduleTableViewCell
        
        switch indexPath {
        //MARK: - Date and Time section
        case [0, 0]:
            alertDate(label: cell.nameCellLabel) { (numberWeekday, date) in
            print(numberWeekday, date)
        }
        case [0, 1]:
            alertsTime(label: cell.nameCellLabel) { (date) in
            print(date)
        }
            
        //MARK: - Lesson's section
        case [1, 0]: alertForCellName(label: cell.nameCellLabel, name: "Name", placeholder: "Enter name of lesson")
        case [1, 1]: alertForCellName(label: cell.nameCellLabel, name: "Type", placeholder: "Enter type of lesson")
        case [1, 2]: alertForCellName(label: cell.nameCellLabel, name: "Building number", placeholder: "Enter number of building")
        case [1, 3]: alertForCellName(label: cell.nameCellLabel, name: "Audience number", placeholder: "Enter number of audience")
            
            
        //MARK: - Teacher's section
        case [2, 0]: pushControllers(viewController: TeachersVC())
            
        //MARK: - Color's section
        case [3, 0]: pushControllers(viewController: ScheduleColorVC())
            
        default:
            print("Tap OptionsTableView")
        }
    }
    
    func pushControllers(viewController: UIViewController) {
        let vc = viewController
        navigationController?.navigationBar.topItem?.title = "Options"
        navigationController?.pushViewController(vc, animated: true)
        
    }
}
