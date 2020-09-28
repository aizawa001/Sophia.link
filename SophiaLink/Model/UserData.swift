//
//  UserData.swift
//  SophiaLink
//
//  Created by 五十嵐慎吉 on 2020/09/25.
//  Copyright © 2020 五十嵐慎吉. All rights reserved.
//

import Foundation
import FirebaseFirestore

//UserDataクラスを作成
class UserData {
    var name: String!
    var monday: TimeSlotData!
    var tuesday: TimeSlotData!
    var wednesday: TimeSlotData!
    var thursday: TimeSlotData!
    var friday: TimeSlotData!
    var saturday: TimeSlotData!
    var documentId: String!
    
    //イニシャライザ
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
    
    let db = Firestore.firestore()
    
    //TImeSlotData型の空の配列を作る
    var timeSlotDatas = [TimeSlotData]()
    
    //TimeSlotDataを取り出す
    func getTimeSlotData(from ref: DocumentReference, completion : @escaping ((TimeSlotData?) -> Void)){

        //timeSlotDataコレクションをを取得し、全てのDocumentごとの情報を取得
        db.collection("timeSlotData").getDocuments(){(snapshot, error)in
            //もしエラーならやめる
            if let error = error{
                print(error)
            }
            
            //optional変数であるため"guard let"
            guard let snap = snapshot else { return }
            
            //snapから取り出す
            for document in snap.documents{
                
                let c_0 = document["c_0"] as! DocumentReference
                let c_1 = document["c_1"] as! DocumentReference
                let c_2 = document["c_2"] as! DocumentReference
                let c_3 = document["c_3"] as! DocumentReference
                let c_4 = document["c_4"] as! DocumentReference
                let c_5 = document["c_5"] as! DocumentReference
                let c_6 = document["c_6"] as! DocumentReference
                let user_id = document["user_id"] as! String
                let documentId = document.documentID
                
                let newTimeSlot = TimeSlotData(c_0: c_0, c_1: c_1, c_2: c_2, c_3: c_3, c_4: c_4, c_5: c_5, c_6: c_6, user_id: user_id, documentId: documentId)
                
                //timeSlotDatas配列にnewTimeSlotを挿入
                self.timeSlotDatas.append(newTimeSlot)
            }
        }
    }
}
