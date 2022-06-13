//
//  ScheduleModel.swift
//  MySchedule
//
//  Created by Nikita Evdokimov on 30.05.2022.
//

import RealmSwift

class ScheduleModel: Object {
    @Persisted var scheduleDate: Date?
    @Persisted var scheduleTime: Date?
    @Persisted var scheduleName: String = "Unknown"
    @Persisted var scheduleType: String = "Unknown"
    @Persisted var scheduleBuilding: String = "Unknown"
    @Persisted var scheduleAudience: String = "Unknown"
    @Persisted var scheduleTeacher: String = "Unknown"
    @Persisted var scheduleColor: String = "C4ECF6" //pastelBlue
    @Persisted var scheduleIsRepeat: Bool = true
    @Persisted var scheduleWeekday: Int = 1
}

