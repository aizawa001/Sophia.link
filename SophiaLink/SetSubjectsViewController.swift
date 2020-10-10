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
    
//    //配列を作る
//    var collegeClassData = [CollegeClassData]()
//
//    var userDatas = [UserData]()
    
    //遷移先で必要
    var collegeClass:CollegeClassData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //画面が表示されるたびに表示
//    override func viewWillAppear(_ animated: Bool) {
//        //delegateとdatasourceを設定
//        timeTableCollectionView.delegate = self
//        timeTableCollectionView.dataSource = self
//
//        //配列を初期化
//        collegeClassData = [CollegeClassData]()
//
//        //ここでcollegeClassData配列に詰め込む
//        db.collection("userData").getDocuments(){(snapshot, error)in
//            //もしエラーならやめる
//            if let error = error{
//                print(error)
//            }
//
//            //optional変数であるため"guard let"
//            guard snapshot != nil else { return }
//
//
//            //snapから取り出す
//            //            for document in snap.documents{
//            //                let name = document["name"] as! String
//            //                let monday = document["monday"] as! TimeSlotData
//            //                let tuesday = document["tuesday"] as! TimeSlotData
//            //                let wednesday = document["wednesday"] as! TimeSlotData
//            //                let thursday = document["thursday"] as! TimeSlotData
//            //                let friday = document["friday"] as! TimeSlotData
//            //                let saturday = document["saturday"] as! TimeSlotData
//            //                let documentId = document.documentID
//            //
//            //                let newUser = UserData(name: name,monday: monday,tuesday: tuesday,wednesday: wednesday,thursday: thursday,friday: friday,saturday: saturday,documentId: documentId)
//            //                self.userDatas.append(newUser)
//            //            }
//            //timeTableControllerを更新
//            self.timeTableCollectionView.reloadData()
//        }
//    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // 表示するセルの数
        //return timeSlotData.collegeClassDatas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // 表示するセルを登録(先程命名した"Cell")
        if  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? MySettingClassCell{
            
            //parseDataを実行
            var timeSlotData = TimeSlotData(c_0: DocumentReference, c_1: DocumentReference, c_2: DocumentReference, c_3: DocumentReference, c_4: DocumentReference, c_5: DocumentReference, c_6: DocumentReference, user_id: String, documentId: String)
            timeSlotData.parseData()
            // セルの色
            cell.backgroundColor = .gray
            return cell
        }else{
            return UICollectionViewCell()
        }
    
    
    //segueの設定
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        collegeClass = collegeClassData[indexPath.row]
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





