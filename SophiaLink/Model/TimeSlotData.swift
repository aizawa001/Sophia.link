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
    
    //DocumentSnapshot型のdocument変数
    private var document: DocumentSnapshot
    
    //イニシャライザ
    //こうしておくと詰め込むとき、documentだけ渡せば良い
    init(document: DocumentSnapshot){
        self.document = document
    }
    
    //配列を作る
    var collegeClassDatas = [CollegeClassData]()
    
    //CollegeClassDataを取り出す
    func getCollegeClassData(from ref: DocumentReference, completion : @escaping ((CollegeClassData?) -> Void)) {
        
        
        //引数(document)を受けとります toku
        //timeSlotDataコレクションを取得し、全てのDocumentごとの情報を取得
        ref.getDocument(){(document, error) in
            
            //もしエラーならやめる
            if let error = error{
                print(error)
            }

            //document変数をアンラップし、CollegeClassDataの引数に入れcollegeClassDataを作成する。
            if let document = document{
               let collegeClassData =  CollegeClassData(document: document)
                completion(collegeClassData)
            }else{
                completion(nil)
            }
            
            
        //データを取得
//        db.collection("collegeClassData").getDocuments(){(snapshot, error)in
//            //もしエラーならやめる
//            if let error = error{
//                print(error)
//            }
//
//            //optional変数であるため"guard let"
//            guard let snap = snapshot else { return }
//            //snapから取り出す
//            for document in snap.documents{
//
//                let subject = document["subject"] as! String
//                let professor = document["professor"] as! String
//                let classroom = document["classroom"] as! String
//                let documentId = document.documentID
//
//                let newCollegeClass = CollegeClassData(classroom: classroom, professor: professor, subject: subject, documentId: documentId)
//
//                self.collegeClassDatas.append(newCollegeClass)
//            }
            }
        
    }
}
