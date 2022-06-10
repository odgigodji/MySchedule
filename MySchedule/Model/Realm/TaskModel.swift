//
//  TaskModel.swift
//  MySchedule
//
//  Created by Nikita Evdokimov on 10.06.2022.
//

import RealmSwift

class TaskModel: Object {
    @Persisted var taskDate: Date?
    @Persisted var taskName: String = "Unknown"
    @Persisted var taskDescription: String = "Unknown"
    @Persisted var taskColor: String = "1A4766"
    @Persisted var taskIsReady: Bool = false
}
