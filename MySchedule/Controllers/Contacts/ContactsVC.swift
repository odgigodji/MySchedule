//  ContactsVC.swift
//  MySchedule
//
//  Created by Nikita Evdokimov on 26.05.2022.
//

import UIKit
import RealmSwift
import SwiftUI

class ContactsVC : UIViewController {
    
    private let searchController = UISearchController()
    
    private let segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Friends", "Teachers"])
        
        segmentedControl.selectedSegmentIndex = 0
        return segmentedControl
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        
        tableView.backgroundColor = .white//.ultraLightGray()
        tableView.separatorStyle = .singleLine
//        tableView.bounces = false

        return tableView
    }()
    
    private let idContactsCell = "idContactsCell"
    
    private let localRealm = try! Realm()
    private var contactsArray: Results<ContactModel>!
    private var filteredArray: Results<ContactModel>!
    
    private var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return true}
        return text.isEmpty
    }
    
    private var isFiltering: Bool {
        return searchController.isActive && !searchBarIsEmpty
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        //MARK: - searchController settings
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        
        //MARK: - set contactArray from DB
        contactsArray = localRealm.objects(ContactModel.self).filter("contactType = 'Friend'")
        
        //MARK: - style for Option Tasks TableVC
        title = "Contacts"
        
        //MARK: - delegate, dataSource and register for Cell and headers
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ContactsTableViewCell.self, forCellReuseIdentifier: idContactsCell)
        
        setConstraints()
        swipeRightAction()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
        segmentedControl.addTarget(self, action: #selector(segmentChanged), for: .valueChanged)
        
    }
    
    @objc private func segmentChanged() {
        
        if segmentedControl.selectedSegmentIndex == 0 {
            contactsArray = localRealm.objects(ContactModel.self).filter("contactType = 'Friend'")
        } else {
            contactsArray = localRealm.objects(ContactModel.self).filter("contactType = 'Teacher'")
        }
        tableView.reloadData()
    }
    
    @objc private func addButtonTapped() {
        let contactOption = ContactOptionsTableVC()
        navigationController?.pushViewController(contactOption, animated: true)
    }
    
    @objc private func editingModel(contactModel: ContactModel) {
        let contactOption = ContactOptionsTableVC()
        contactOption.contactModel = contactModel
        contactOption.isEditingModel = true
        
        contactOption.cellNameArray = [
            contactModel.contactName,
            contactModel.contactPhone,
            contactModel.contactMail,
            contactModel.contactType,
            ""
        ]
        
        navigationController?.pushViewController(contactOption, animated: true)
    }
    
    private func pushControllers(viewController: UIViewController) {
        let vc = viewController
        navigationController?.navigationBar.topItem?.title = "Options"
        navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK: - swipeRightAction(in work..)
    private func swipeRightAction() {
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleRightSwipe))
        swipeRight.direction = .right
        tableView.addGestureRecognizer(swipeRight)
    }
    
    @objc private func handleRightSwipe() {
        print("right swipe")
    }
}

//MARK: - UITableViewDelegate, UITableViewDataSource
extension ContactsVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isFiltering ? filteredArray.count : contactsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idContactsCell, for: indexPath) as! ContactsTableViewCell
        let model = isFiltering ? filteredArray[indexPath.row] : contactsArray[indexPath.row]
        cell.configure(model: model)
        return cell
    }
    
    //MARK: - set height of the cell
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
   
    //MARK: - didSelectRowAt
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = contactsArray[indexPath.row]
        editingModel(contactModel: model)
    }
    
    //MARK: - trailingSwipeActionConfiguration
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let editingRow = contactsArray[indexPath.row]
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { _, _, completionHandler in
            RealmManager.shared.deleteContactModel(model: editingRow)
            tableView.reloadData()
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}

extension ContactsVC: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
        filterContactForSearchText(searchController.searchBar.text!)
    }
    
    private func filterContactForSearchText(_ searchText: String) {
        filteredArray = contactsArray.filter("contactName CONTAINS[c] %@", searchText)
        tableView.reloadData()
    }
}

//MARK: - set constraints
extension ContactsVC {
    
    private func setConstraints() {
        
        let stackView = UIStackView(arrangedSubviews: [segmentedControl, tableView], axis: .vertical, spacing: 0, distribution: .equalSpacing)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
