//
//  ScheduleOptionsTableVC.swift
//  MySchedule
//
//  Created by Nikita Evdokimov on 22.05.2022.
//

import UIKit

class ScheduleOptionsTableVC : UITableViewController {
    
    private let idOptionsScheduleCell = "idOptionsCell"
    private let idOptionsScheduleHeader = "idOptionsScheduleHeader"
    
    let headerNamesArray = ["ДАТА И ВРЕМЯ", "ПРЕДМЕТ", "ПРЕПОДАВАТЕЛЬ", "ЦВЕТ", "ПЕРИОД"]
    
    var cellNameArray = [["Дата", "Время"],
                         ["Имя", "Тип", "Корпус", "Аудитория"],
                         ["Teacher's name"],
                         [""],
                         ["Повторять каждые 7 дней"]]
    
    //MARK: - scheduleModel
    var scheduleModel = ScheduleModel()
    
    var hexColorCell = "C4ECF6"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: - style for Opotion Scheduole TableVC
        title = "Options Schedule"
        tableView.backgroundColor = .ultraLightGray()
        tableView.separatorStyle = .none
//        tableView.bounces = false
        
        //MARK: - delegate, dataSource and register for Cell and headers
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(OptionsTableViewCell.self, forCellReuseIdentifier: idOptionsScheduleCell)
        tableView.register(HeaderOptionsTableViewCell.self, forHeaderFooterViewReuseIdentifier: idOptionsScheduleHeader)
        
        //MARK: - save button
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveButtonTapped))
    }
    
    //MARK: - saveButtonTapped - save model in DB
    @objc private func saveButtonTapped() {
       
        if scheduleModel.scheduleDate == nil || scheduleModel.scheduleTime == nil || scheduleModel.scheduleName == "Unknown" {
            alertOK(title: "Error", message: "Required fields: DATE, TIME, NAME")
        } else {
            scheduleModel.scheduleColor = hexColorCell
            RealmManager.shared.saveScheduleModel(model: scheduleModel)
            scheduleModel = ScheduleModel()
            
            alertOK(title: "Success", message: nil)
            hexColorCell = "C4ECF6"
            cellNameArray[2][0] = "Teacher's name"
            tableView.reloadData()
        }
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
        let cell = tableView.dequeueReusableCell(withIdentifier: idOptionsScheduleCell, for: indexPath) as! OptionsTableViewCell
        let color = UIColor().colorFromHex(hexColorCell)
        cell.scheduleConfigure(nameArray: cellNameArray, indexPath: indexPath, hexColor: hexColorCell)
        cell.backgroundViewCell.backgroundColor = (indexPath.section == 3 ? color : .white)
        cell.switchRepeatDelegate = self
        return cell
    }
    
    //MARK: - set height of the cell
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    //MARK: - set header in table view
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: idOptionsScheduleHeader) as! HeaderOptionsTableViewCell
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
        
        switch indexPath {
        //MARK: - Date and Time section
        case [0, 0]:
            alertDate(label: cell.nameCellLabel) { (numberWeekday, date) in
                self.scheduleModel.scheduleDate = date
                self.scheduleModel.scheduleWeekday = numberWeekday
        }
        case [0, 1]:
            alertsTime(label: cell.nameCellLabel) { (time) in
                self.scheduleModel.scheduleTime = time
        }
            
        //MARK: - Lesson's section
        case [1, 0]: alertForCellName(label: cell.nameCellLabel, name: "Name", placeholder: "Enter name of lesson") { (text) in
            self.scheduleModel.scheduleName = text
        }
        case [1, 1]: alertForCellName(label: cell.nameCellLabel, name: "Type", placeholder: "Enter type of lesson") { (text) in
            self.scheduleModel.scheduleType = text
        }
        case [1, 2]: alertForCellName(label: cell.nameCellLabel, name: "Building number", placeholder: "Enter number of building") { (text) in
            self.scheduleModel.scheduleBuilding = text
        }
        case [1, 3]: alertForCellName(label: cell.nameCellLabel, name: "Audience number", placeholder: "Enter number of audience") { (text) in
            self.scheduleModel.scheduleAudience = text
        }
            
        //MARK: - Teacher's section
        case [2, 0]: pushControllers(viewController: TeachersTableVC())
            
        //MARK: - Color's section
        case [3, 0]: pushControllers(viewController: ScheduleColorsVC())
        default:
            print("Tap OptionsTableView")
        }
    }
    
    private func pushControllers(viewController: UIViewController) {
        let vc = viewController
        navigationController?.navigationBar.topItem?.title = "Options"
        navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK: - SwitchRepeatProtocol
extension ScheduleOptionsTableVC: SwitchRepeatProtocol {
    func switchRepeat(value: Bool) {
        scheduleModel.scheduleIsRepeat = value
    }
}
