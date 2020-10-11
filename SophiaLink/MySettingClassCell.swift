//
//  MySettingClassCell.swift
//  SophiaLink
//
//  Created by 五十嵐慎吉 on 2020/09/13.
//  Copyright © 2020 五十嵐慎吉. All rights reserved.
//

import UIKit
import Firebase

class MySettingClassCell: UICollectionViewCell {
    
    //全てオプショナル変数
    @IBOutlet weak var subjectLabel: UILabel?
    @IBOutlet weak var professorLabel: UILabel?
    @IBOutlet weak var classroomLabel: UILabel?

    func parseData(collegeClassData :CollegeClassData){
        subjectLabel?.text = collegeClassData.subject
        professorLabel?.text = collegeClassData.professor
        classroomLabel?.text = collegeClassData.classroom
    }
    
    func parseData(timeSlotData :TimeSlotData){
        subjectLabel?.text = timeSlotData.c_0 as? String
        professorLabel?.text = timeSlotData.c_1 as? String
        classroomLabel?.text = timeSlotData.c_2 as? String
    }
    
    let user = Auth.auth().currentUser
}
