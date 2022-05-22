//
//  OptionsShadowVC.swift
//  MySchedule
//
//  Created by Nikita Evdokimov on 22.05.2022.
//

import UIKit

class OptionsShadowVC : UITableViewController {
    
    let idOptionsShadowCell = "idOptionsShadowCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Option Schedule"
        view.backgroundColor = .white
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: idOptionsShadowCell)
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
        let cell = tableView.dequeueReusableCell(withIdentifier: idOptionsShadowCell, for: indexPath)
        cell.textLabel!.text = " asdf "
        return cell
    }
}
