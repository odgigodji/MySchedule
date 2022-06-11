//
//  OptionsTaskTableVC.swift
//  MySchedule
//
//  Created by Nikita Evdokimov on 25.05.2022.
//

import UIKit

class TaskOptionsTableVC : UITableViewController {
    
    private let idOptionsTaskCell = "idOptionsTaskCell"
    private let idOptionsTasksHeader = "idOptionsTasksHeader"
    
    private let headerNamesArray = ["DATE", "LESSON", "TASK", "COLOR"]
    private let cellNameArray = ["Date", "Lesson", "Task", ""]
    
    var hexColorCell = "1A4766"
    
    private var taskModel = TaskModel()
    
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
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveButtonTapped))
    }
    
    @objc private func saveButtonTapped() {
        if taskModel.taskDate == nil || taskModel.taskName == "Unknown" {
            alertOK(title: "Error", message: "Required fields: DATE, LESSON")
        } else {
            taskModel.taskColor = hexColorCell
            RealmManager.shared.saveTaskModel(model: taskModel)
            taskModel = TaskModel()
            alertOK(title: "Success", message: nil)
            hexColorCell = "1A4766"
            tableView.reloadData()
        }
    }
    
    private func pushControllers(viewController: UIViewController) {
        let vc = viewController
        navigationController?.navigationBar.topItem?.title = "Options"
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idOptionsTaskCell, for: indexPath) as! OptionsTableViewCell
        cell.tasksConfigure(nameArray: cellNameArray, indexPath: indexPath, hexColor: hexColorCell)
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
        case 0: alertDate(label: cell.nameCellLabel) { _, date in
            self.taskModel.taskDate = date
        }
        case 1: alertForCellName(label: cell.nameCellLabel, name: "Name Lesson", placeholder: "Enter name of lesson") { (text) in
            self.taskModel.taskName = text
        }
        case 2: alertForCellName(label: cell.nameCellLabel, name: "Task", placeholder: "Enter name of lesson") { (text) in
            self.taskModel.taskDescription = text
        }
        case 3: pushControllers(viewController: TaskColorsTableVC())
        default:
            print("Tap Color tab view")
        }
    }
}

