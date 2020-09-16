//
//  CollegeClassData.swift
//  SophiaLink
//
//  Created by MacBook16 on 2020/09/14.
//  Copyright © 2020 五十嵐慎吉. All rights reserved.
//

import Foundation

class CollegeClassData{

    private var classroom:String!
    private var professor:String!
    private var subject:String!
    private var documentId:String!

    init(classroom:String, professor:String, subject:String, documentId:String){
        self.classroom = classroom
        self.professor = professor
        self.subject = subject
        self.documentId = documentId
    }


}
