//
//  PressButtonProtocols.swift
//  MySchedule
//
//  Created by Nikita Evdokimov on 20.05.2022.
//

import Foundation

protocol PressReadyTaskButtonProtocol: AnyObject {
    func readyButtonTapped(indexPath: IndexPath)
}

protocol SwitchRepeatProtocol: AnyObject {
    func switchRepeat(value: Bool)
}
