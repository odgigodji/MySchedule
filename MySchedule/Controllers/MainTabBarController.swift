//
//  ViewController.swift
//  MySchedule
//
//  Created by Nikita Evdokimov on 08.05.2022.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupTabBar()
        
    }
    
    func setupTabBar() {
        let scheduleVC = createNavController(vc: ScheduleVC(), itemName: "Schedule", itemImage: "calendar.badge.clock")
        let tasksVC = createNavController(vc: TasksVC(), itemName: "Tasks", itemImage: "text.badge.checkmark")
        let contactsVC = createNavController(vc: ContactsVC(), itemName: "Contacts", itemImage: "rectangle.stack.person.crop")
        
        viewControllers = [scheduleVC, tasksVC, contactsVC]
    }

    func createNavController(vc: UIViewController, itemName: String, itemImage: String) -> UINavigationController {
        
        //MARK: - create NavItem
        let image = UIImage(systemName: itemImage)?.withAlignmentRectInsets(.init(top: -1, left: 0, bottom: 0, right: 0))
        let item = UITabBarItem(title: itemName, image: image, tag: 0)
        item.titlePositionAdjustment = .init(horizontal: 0, vertical: -1)
        
        //MARK: - create NavController
        let navController = UINavigationController(rootViewController: vc)
        
        //MARK: - set item to navController
        navController.tabBarItem = item
        return navController
    }
    
}

