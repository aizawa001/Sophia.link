//
//  UserData.swift
//  SophiaLink
//
//  Created by 五十嵐慎吉 on 2020/09/25.
//  Copyright © 2020 五十嵐慎吉. All rights reserved.
//

import Foundation
import Firebase

class UserData {
    var name: String!
    var monday: TimeSlotData!
    var tuesday: TimeSlotData!
    var wednesday: TimeSlotData!
    var thursday: TimeSlotData!
    var friday: TimeSlotData!
    var saturday: TimeSlotData!
    var documentId: String!
    
    init(name: String,monday: TimeSlotData,tuesday: TimeSlotData,wednesday: TimeSlotData, thursday: TimeSlotData,friday: TimeSlotData,saturday: TimeSlotData,documentId : String){
        self.name = name
        self.monday = monday
        self.tuesday = tuesday
        self.wednesday = wednesday
        self.thursday = thursday
        self.friday = friday
        self.saturday = saturday
        self.documentId = documentId
    }
}
