//
//  AlertForCellName.swift
//  MySchedule
//
//  Created by Nikita Evdokimov on 24.05.2022.
//

import UIKit

extension UIViewController {
    
    func alertForCellName(label: UILabel, name: String, placeholder: String, completionHandler: @escaping (String) -> Void) {
        
        let alert = UIAlertController(title: name, message: nil, preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "OK", style: .default) { (action) in
            
            let textFieldAlert = alert.textFields?.first
            guard let text = textFieldAlert?.text else { return }
            label.text = (text != "" ? text : label.text)
            completionHandler(text)
        }
        
        alert.addTextField { (textFieldAlert) in
            textFieldAlert.placeholder = placeholder
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .default)
        
        alert.addAction(ok)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
        
    }
}
