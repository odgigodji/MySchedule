//  ContactsTableVC.swift
//  MySchedule
//
//  Created by Nikita Evdokimov on 26.05.2022.
//

import UIKit
import RealmSwift

class ContactsTableVC : UITableViewController {
    
    private let searchController = UISearchController()
    
    private let idContactsCell = "idContactsCell"
    
    private let localRealm = try! Realm()
    private var contactArray: Results<ContactModel>!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
//        print(contactArray)
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: - searchController settings
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        
        //MARK: - set contactArray from DB
        contactArray = localRealm.objects(ContactModel.self)
        
        //MARK: - style for Option Tasks TableVC
        title = "Contacts"
        tableView.backgroundColor = .white//.ultraLightGray()
        tableView.separatorStyle = .singleLine
//        tableView.bounces = false
        
        //MARK: - delegate, dataSource and register for Cell and headers
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ContactsTableViewCell.self, forCellReuseIdentifier: idContactsCell)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
    }
    
    @objc private func addButtonTapped() {
        let contactOption = ContactOptionsTableVC()
        navigationController?.pushViewController(contactOption, animated: true)
    }
    
    private func pushControllers(viewController: UIViewController) {
        let vc = viewController
        navigationController?.navigationBar.topItem?.title = "Options"
        navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK: - UITableViewDelegate, UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idContactsCell, for: indexPath) as! ContactsTableViewCell
        let model = contactArray[indexPath.row]
        cell.configure(model: model)
        return cell
    }
    
    //MARK: - set height of the cell
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
   
    //MARK: - didSelectRowAt
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("lal")
    }
    
    //MARK: - trailingSwipeActionConfiguration
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let editingRow = contactArray[indexPath.row]
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { _, _, completionHandler in
            RealmManager.shared.deleteContactModel(model: editingRow)
            tableView.reloadData()
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}


