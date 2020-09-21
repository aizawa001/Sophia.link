//
//  AddSubjectsViewController.swift
//  SophiaLink
//
//  Created by 五十嵐慎吉 on 2020/09/07.
//  Copyright © 2020 五十嵐慎吉. All rights reserved.
//

import UIKit
import FirebaseFirestore

class SetSubjectsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout  {



    @IBOutlet weak var headingVerticalLabel: UILabel!
    @IBOutlet weak var headingLabel: UILabel!
    @IBOutlet weak var timeTableCollectionView: UICollectionView!
    
    var docRef: DocumentReference!

    let db = Firestore.firestore()
    //配列を作る ＝＞まず引数の数が違うので動かないですね
    var collegeClassData = [CollegeClassData]()
//遷移先で必要なので
    var collegeClass:CollegeClassData?

    override func viewDidLoad() {
        super.viewDidLoad()
        //これがないためにエラー
        timeTableCollectionView.delegate = self
        timeTableCollectionView.dataSource = self

        //ここでcollegeClassData配列に詰め込みました。
        db.collection("collegeClassData").getDocuments(){(snapshot, error)in
            //もしエラーならやめる
            if let error = error{
                print(error)
            }

            guard let snap = snapshot else { return  }
            //snapから取り出す
            for document in snap.documents{
                let classroom = document["classroom"] as! String
                let professor = document["professor"] as! String
                let subject = document["subject"] as! String
                let documentId = document.documentID

                let newdocument = CollegeClassData(classroom: classroom, professor: professor, subject: subject, documentId: documentId)
                self.collegeClassData.append(newdocument)

            }
            self.timeTableCollectionView.reloadData()
        }

        
        
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // 表示するセルの数 tokuhara  ここが問題
        return collegeClassData.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // 表示するセルを登録(先程命名した"Cell")
        if  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? MySettingClassCell{
            //parseDataを実行
            cell.parseData(collegeClassData: collegeClassData[indexPath.row])
            // セルの色
            cell.backgroundColor = .gray
            return cell
        }else{
            return UICollectionViewCell()
        }
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collegeClass = collegeClassData[indexPath.row]
        performSegue(withIdentifier: "toAddSubject", sender: nil)

    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize{
        return CGSize(width: headingLabel.frame.size.width,height: headingVerticalLabel.frame.size.height)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAddSubject"{
            let subView =  segue.destination as! AddSubjectViewController
            subView.collegeClassData = collegeClass
        }
    }

//    func collectionView(_ collectionView: UICollectionView, transitionLayoutForOldLayout fromLayout: UICollectionViewLayout, newLayout toLayout: UICollectionViewLayout) -> UICollectionViewTransitionLayout {
//        let customTransitionLayout = TransitionLayout(currentLayout: fromLayout, nextLayout: toLayout)
//           return customTransitionLayout
//    }
}



