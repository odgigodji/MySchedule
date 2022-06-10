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
    
    //MARK: - ScheduleModule
    func saveScheduleModule(model: ScheduleModel) {
        try! localRealm.write {
            localRealm.add(model)
        }
    }
    
    func deleteScheduleModule(model: ScheduleModel) {
        try! localRealm.write {
            localRealm.delete(model)
        }
    }
    
    //MARK: - TaskModule
    func saveTaskModule(model: TaskModel) {
        try! localRealm.write {
            localRealm.add(model)
        }
    }
    
    func deleteTaskModule(model: TaskModel) {
        try! localRealm.write {
            localRealm.delete(model)
        }
    }
    
    func updateReadyButton(task: TaskModel, bool: Bool) {
        try! localRealm.write {
            task.taskIsReady = bool
        }
    }
}
