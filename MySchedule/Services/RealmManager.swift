//
//  RealmManager.swift
//  MySchedule
//
//  Created by Nikita Evdokimov on 30.05.2022.
//

import RealmSwift

class RealmManager {
    static let shared = RealmManager()
    
    private init() {}
    
    let localRealm = try! Realm()
    
    //MARK: - ScheduleModel
    func saveScheduleModel(model: ScheduleModel) {
        try! localRealm.write {
            localRealm.add(model)
        }
    }
    
    func deleteScheduleModel(model: ScheduleModel) {
        try! localRealm.write {
            localRealm.delete(model)
        }
    }
    
    //MARK: - TaskModel
    func saveTaskModel(model: TaskModel) {
        try! localRealm.write {
            localRealm.add(model)
        }
    }
    
    func deleteTaskModel(model: TaskModel) {
        try! localRealm.write {
            localRealm.delete(model)
        }
    }
    
    func updateReadyButton(task: TaskModel, bool: Bool) {
        try! localRealm.write {
            task.taskIsReady = bool
        }
    }
    
    //MARK: - ContactModel
    func saveContactModel(model: ContactModel) {
        try! localRealm.write {
            localRealm.add(model)
        }
    }
    
    func deleteContactModel(model: ContactModel) {
        try! localRealm.write {
            localRealm.delete(model)
        }
    }
}
