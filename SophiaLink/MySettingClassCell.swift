//
//  MySettingClassCell.swift
//  SophiaLink
//
//  Created by 五十嵐慎吉 on 2020/09/13.
//  Copyright © 2020 五十嵐慎吉. All rights reserved.
//

import UIKit

class MySettingClassCell: UICollectionViewCell {
    
    @IBOutlet weak var subjectLabel: UILabel?
    @IBOutlet weak var professorLabel: UILabel?
    
    @IBOutlet weak var classroomLabel: UILabel?

    func parseData(collegeClassData :CollegeClassData){
        subjectLabel?.text = collegeClassData.subject
        professorLabel?.text = collegeClassData.professor
        classroomLabel?.text = collegeClassData.classroom
    }
}
