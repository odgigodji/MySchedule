//
//  UIAlertController.swift
//  MySchedule
//
//  Created by Nikita Evdokimov on 24.05.2022.
//

import UIKit

//MARK: - if undefined error was occur with width == -16
//In project not uses
extension UIAlertController {
    func negativeWidthConstraint() {
        
        for subView in self.view.subviews {
            for constraints in subView.constraints where constraints.debugDescription.contains("width == - 16") {
                subView.removeConstraint(constraints)
            }
        }
    }
}
