//
//  AlertDate.swift
//  MySchedule
//
//  Created by Nikita Evdokimov on 24.05.2022.
//

import UIKit

extension UIViewController {
    
    func alertDate(label: UILabel, completionHandler: @escaping (Int, NSDate) -> Void) {
        
        let alert = UIAlertController(title: "", message: nil, preferredStyle: .actionSheet)
        
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        
        alert.view.addSubview(datePicker)
        
        let ok = UIAlertAction(title: "OK", style: .default) { (action) in
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd.MM.yyyy"
            let dateString = dateFormatter.string(from: datePicker.date)
            
            let calendar = Calendar.current
            let component = calendar.dateComponents([.weekday], from: datePicker.date)
            guard let weekDay = component.weekday else { return }
        }
    }
}
