//
//  AddSubjectsViewController.swift
//  SophiaLink
//
//  Created by 五十嵐慎吉 on 2020/09/07.
//  Copyright © 2020 五十嵐慎吉. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore

class SetSubjectsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout  {
    
    @IBOutlet weak var headingVerticalLabel: UILabel!
    @IBOutlet weak var headingLabel: UILabel!
    @IBOutlet weak var timeTableCollectionView: UICollectionView!
    
    let db = Firestore.firestore()
    
    //CollectionRef型のRefを作る
    private var collegeClassDataCollectionRef: CollectionReference!
    private var timeSlotDataCollectionRef: CollectionReference!
    
//    //collegeClassDatas配列を作る
//    var collegeClassDatas = [CollegeClassData]()
    
    //timeSlotDatas配列を作る
    var timeSlotDatas = [TimeSlotData]()
    
    //遷移先で必要
    var collegeClass:CollegeClassData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //delegateとdatasourceを設定
        timeTableCollectionView.delegate = self
        timeTableCollectionView.dataSource = self
        
//        collegeClassDataCollectionRef = db.collection(COLLEGE_CLASS_DATA)
        timeSlotDataCollectionRef = db.collection(TIMESLOT_DATA)
    }
    
    //tokuhara とりあえずCollegeClassDataを表示する方法をまず理解しましょう!
    //画面が表示されるたびに表示
//    override func viewWillAppear(_ animated: Bool) {
//        //配列を削除
//        collegeClassDatas.removeAll()
//        //ここでcollegeClassData配列に詰め込む
//        collegeClassDataCollectionRef.getDocuments(){(snapshot, error)in
//            //もしエラーならやめる
//            if let error = error{
//                print(error)
//            }
//            //optional変数であるため"guard let"
//            guard let snap = snapshot else { return }
//            // snapから取り出す
//            for document in snap.documents{
//                let classroom = document["classroom"] as! String
//                let professor = document["professor"] as! String
//                let subject = document["subject"] as! String
//                let documentId = document.documentID
//
//
//                let newClassData = CollegeClassData(classroom: classroom,professor: professor,subject: subject, documentId: documentId)
//                self.collegeClassDatas.append(newClassData)
//            }
//            //            timeTableControllerを更新
//            self.timeTableCollectionView.reloadData()
//        }
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        timeSlotDatas.removeAll()
        timeSlotDataCollectionRef.getDocuments(){(snapshot,error)in
            if let error = error {
                print(error)
            }
            guard let snap = snapshot else { return }
            for document in snap.documents{
                let c_0 = document["c-0"] as! DocumentReference
                let c_1 = document["c-1"] as! DocumentReference
                let c_2 = document["c-2"] as! DocumentReference
                let c_3 = document["c-3"] as! DocumentReference
                let c_4 = document["c-4"] as! DocumentReference
                let c_5 = document["c-5"] as! DocumentReference
                let c_6 = document["c-6"] as! DocumentReference
                let user_id = document["user_id"] as! String
                let documentId = document.documentID
             
                let newTimeSlot = TimeSlotData(c_0: c_0, c_1: c_1, c_2: c_2, c_3: c_3, c_4: c_4, c_5: c_5, c_6: c_6, user_id: user_id, documentId: documentId)
                             
                //timeSlotDatas配列にnewTimeSlotを挿入
                self.timeSlotDatas.append(newTimeSlot)
                
            }
        }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // 表示するセルの数
        return timeSlotDatas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // 表示するセルを登録(先程命名した"Cell")
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? MySettingClassCell{
            //cellを表示するparseDataを実行
            cell.parseData(timeSlotData: timeSlotDatas[indexPath.row])
            return cell
        }else{
            return UICollectionViewCell()
        }
    }
    
    
    
    //segueの設定
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toAddSubject", sender: nil)
    }
    
    //cellのサイズを設定
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize{
        return CGSize(width: headingLabel.frame.size.width,height: headingVerticalLabel.frame.size.height)
    }
    
    //遷移前の処理
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAddSubject"{
            let subView =  segue.destination as! AddSubjectViewController
            //遷移先のcollegeClassDataにcollegeClassを代入する
            subView.collegeClassData = collegeClass
        }
    }
    
    //    func collectionView(_ collectionView: UICollectionView, transitionLayoutForOldLayout fromLayout: UICollectionViewLayout, newLayout toLayout: UICollectionViewLayout) -> UICollectionViewTransitionLayout {
    //        let customTransitionLayout = TransitionLayout(currentLayout: fromLayout, nextLayout: toLayout)
    //           return customTransitionLayout
    //    }
}





