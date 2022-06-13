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
    @Persisted var taskColor: String = "C4ECF6" //pastelBlue
    @Persisted var taskIsReady: Bool = false
}
