//
//  TimeSlotData.swift
//  SophiaLink
//
//  Created by 五十嵐慎吉 on 2020/09/25.
//  Copyright © 2020 五十嵐慎吉. All rights reserved.
//

import Foundation

import FirebaseFirestore

//TimeSlotDataクラスを作成
class TimeSlotData{

    let db = Firestore.firestore()


    var c_0: DocumentReference!
    var c_1: DocumentReference!
    var c_2: DocumentReference!
    var c_3: DocumentReference!
    var c_4: DocumentReference!
    var c_5: DocumentReference!
    var c_6: DocumentReference!
    var user_id: String!
    var documentId: String!
    
    //イニシャライザ
//    init(c_0: DocumentReference,c_1: DocumentReference,c_2: DocumentReference,c_3: DocumentReference, c_4: DocumentReference,c_5: DocumentReference,c_6: DocumentReference,user_id: String,documentId : String){
//        self.c_0 = c_0
//        self.c_1 = c_1
//        self.c_2 = c_2
//        self.c_3 = c_3
//        self.c_4 = c_4
//        self.c_5 = c_5
//        self.c_6 = c_6
//        self.user_id = user_id
//        self.documentId = documentId
//    }

    //こうしておくと詰め込むとき、documentだけ渡せば良い
    init(document: DocumentSnapshot){
        c_0 = document["c-0"] as? DocumentReference
        c_1 = document["c-0"] as? DocumentReference
        c_2 = document["c-0"] as? DocumentReference
        c_3 = document["c-0"] as? DocumentReference
        c_4 = document["c-0"] as? DocumentReference
        c_5 = document["c-0"] as? DocumentReference
        c_6 = document["c-0"] as? DocumentReference
        user_id = document["user_id"] as? String
        documentId = document.documentID

    }
    
    //配列を作る
    var collegeClassDatas = [CollegeClassData]()
    
    //CollegeClassDataを取り出す
    func getCollegeClassData(from ref: DocumentReference, completion : @escaping ((CollegeClassData?) -> Void)) {
        
        //データを取得
        db.collection("collegeClassData").getDocuments(){(snapshot, error)in
            //もしエラーならやめる
            if let error = error{
                print(error)
            }
            
            //optional変数であるため"guard let"
            guard let snap = snapshot else { return }
            //snapから取り出す
            for document in snap.documents{
                
                let subject = document["subject"] as! String
                let professor = document["professor"] as! String
                let classroom = document["classroom"] as! String
                let documentId = document.documentID
                
                let newCollegeClass = CollegeClassData(classroom: classroom, professor: professor, subject: subject, documentId: documentId)
                
                self.collegeClassDatas.append(newCollegeClass)
            }
        }
        
    }
}
