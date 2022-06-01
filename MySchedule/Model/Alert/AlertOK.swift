//
//  AlertOK.swift
//  MySchedule
//
//  Created by Nikita Evdokimov on 01.06.2022.
//

import UIKit

extension UIViewController {
    
    func alertOK(title: String) {
        
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "OK", style: .default)
            
        alert.addAction(ok)
        
        present(alert, animated: true, completion: nil)
    }
}
