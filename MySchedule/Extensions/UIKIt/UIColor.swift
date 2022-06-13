//
//  UIColor.swift
//  MySchedule
//
//  Created by Nikita Evdokimov on 23.05.2022.
//

import UIKit

extension UIColor {
    
   //MARK: - ultra light gray
    static func ultraLightGray() -> UIColor? {
        return .init(white: 0.9, alpha: 1.0)
    }

    static func pastelBlue() -> UIColor {
        return UIColor().colorFromHex("C4ECF6")
    }
}

//MARK: - color from hex
extension UIColor {
    func colorFromHex(_ hex: String) -> UIColor {
        var hexString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if hexString.hasPrefix("#") {
            hexString.remove(at: hexString.startIndex)
        }
        
        if hexString.count != 6 {
            return UIColor.black
        }
        
        var rgb: UInt64 = 0
        Scanner(string: hexString).scanHexInt64(&rgb)
        
        return UIColor.init(red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
                            green:  CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
                            blue: CGFloat((rgb & 0x0000FF) ) / 255.0,
                            alpha: 1.0)
    }
}
