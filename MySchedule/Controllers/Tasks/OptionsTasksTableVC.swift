//
//  OptionsTaskTableVC.swift
//  MySchedule
//
//  Created by Nikita Evdokimov on 25.05.2022.
//

import UIKit

class OptionsTasksTableVC : UITableViewController {
    
    let idOptionsTaskCell = "idOptionsTaskCell"
    let idOptionsTasksHeader = "idOptionsTasksHeader"
    
    let headerNamesArray = ["DATE", "LESSON", "TASK", "COLOR"]
    
    let cellNameArray = ["Date", "Lesson", "Task", ""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: - style for Option Tasks TableVC
        title = "Options Tasks"
        tableView.backgroundColor = .ultraLightGray()
        tableView.separatorStyle = .none
        tableView.bounces = false
        
        //MARK: - delegate, dataSource and register for Cell and headers
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(OptionsTableViewCell.self, forCellReuseIdentifier: idOptionsTaskCell)
        tableView.register(HeaderOptionsTableViewCell.self, forHeaderFooterViewReuseIdentifier: idOptionsTasksHeader)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idOptionsTaskCell, for: indexPath) as! OptionsTableViewCell
        cell.tasksConfigure(nameArray: cellNameArray, indexPath: indexPath)
        return cell
    }
    
    //MARK: - set height of the cell
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    //MARK: - set header in table view
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: idOptionsTasksHeader) as! HeaderOptionsTableViewCell
        header.configure(nameArray: headerNamesArray, section: section)
        return header
    }
    
    //MARK: - heightForHeaderInSection
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        40
    }
    
    //MARK: - didSelectRowAt
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! OptionsTableViewCell
        
        switch indexPath.section {
        case 0: alertDate(label: cell.nameCellLabel) { (numberWeekday, date) in
            print(numberWeekday, date)
        }
        case 1: alertForCellName(label: cell.nameCellLabel, name: "Name Lesson", placeholder: "Enter name of lesson")
        case 2: alertForCellName(label: cell.nameCellLabel, name: "Task", placeholder: "Enter name of lesson")
        case 3: pushControllers(viewController: ColorTaskTableVC())
        default:
            print("Tap Color tab view")
        }
    }
    
    func pushControllers(viewController: UIViewController) {
        let vc = viewController
        navigationController?.navigationBar.topItem?.title = "Options"
        navigationController?.pushViewController(vc, animated: true)
    }
}

