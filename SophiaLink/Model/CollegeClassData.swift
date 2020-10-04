//
//  CollegeClassData.swift
//  SophiaLink
//
//  Created by MacBook16 on 2020/09/14.
//  Copyright © 2020 五十嵐慎吉. All rights reserved.
//

import Foundation
import FirebaseFirestore

class CollegeClassData{

     var classroom: String!
     var professor: String!
     var subject: String!
     var documentId: String!
    
    //DocumentSnapshot型のdocument変数
    private var document: DocumentSnapshot
    
    //イニシャライザ
    //こうしておくと詰め込むとき、documentだけ渡せば良い
    init(document: DocumentSnapshot){
        self.document = document
    }

//    init(classroom: String, professor: String, subject: String, documentId: String){
//        self.classroom = classroom
//        self.professor = professor
//        self.subject = subject
//        self.documentId = documentId
//    }


}
