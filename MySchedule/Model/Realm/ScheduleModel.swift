//
//  ScheduleModel.swift
//  MySchedule
//
//  Created by Nikita Evdokimov on 30.05.2022.
//

import RealmSwift

class ScheduleModel: Object {
    @Persisted var scheduleDate = Date()
    @Persisted var scheduleTime = Date()
    @Persisted var scheduleName: String = ""
    @Persisted var scheduleType: String = ""
    @Persisted var scheduleBuilding: String = ""
    @Persisted var scheduleAudience: String = ""
    @Persisted var scheduleTeacher: String = ""
    @Persisted var scheduleColor: String = ""
    @Persisted var scheduleIsRepeat: Bool = true
    @Persisted var scheduleWeekday: Int = 1
}

