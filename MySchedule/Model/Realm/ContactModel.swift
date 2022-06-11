//
//  ContactModel.swift
//  MySchedule
//
//  Created by Nikita Evdokimov on 11.06.2022.
//

import RealmSwift

class ContactModel: Object {
    @Persisted var contactName = "Unknown"
    @Persisted var contactPhone: String = "Unknown"
    @Persisted var contactMail: String = "Unknown"
    @Persisted var contactType: String = "Unknown"
    @Persisted var contactImage: Data?
}
