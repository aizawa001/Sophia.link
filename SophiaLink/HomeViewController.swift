//
//  HomeViewController.swift
//  SophiaLink
//
//  Created by 五十嵐慎吉 on 2020/09/04.
//  Copyright © 2020 五十嵐慎吉. All rights reserved.
//

import UIKit
import FirebaseFirestore
import Firebase

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
    let db = Firestore.firestore()
    
    //ログイン状態の保持
    private var handle: AuthStateDidChangeListenerHandle?
    
    //UserData型のuserDatas配列を作る。
    var userData: UserData?
    
    
    @IBOutlet weak var timeTableCllectionView: UICollectionView!
    
    @IBOutlet weak var headingLabel: UILabel!
    
    @IBOutlet weak var headingVerticalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeTableCllectionView.delegate = self
        timeTableCllectionView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //現在ログインしているユーザーを確認
        handle = Auth.auth().addStateDidChangeListener({ (auth, user) in
            if user == nil{
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let loginVC = storyboard.instantiateViewController(withIdentifier: "loginVC")
                self.present(loginVC, animated: true)
            } else {
                //ログイン監視する関数を呼ぶ
            //    self.setListener()
            }
        })
        
    }
    
    
    //ログインを監視する関数

//    func setListener() {
//        if db.collection("userData").document().documentID == Auth.auth().currentUser?.uid {
//
//            //必要なコレクションのスナップショットを取得
//            db.collection("userData").document().addSnapshotListener({ (snapshot, err) in
//                if let error = err{
//                    print(error)
//                }else{
//                    //配列を削除して
//                    self.userDatas.removeAll()
//                    //配列にsnapshotでdata取得して
//                    guard let snap = snapshot else { return }
//                    for document in snap.documents {
//                        let name = document["name"] as! String
//                        let monday = document["monday"] as! TimeSlotData
//                        let tuesday = document["tuesday"] as! TimeSlotData
//                        let wednesdsay = document["wednesday"] as! TimeSlotData
//                        let thursday = document["thursday"] as! TimeSlotData
//                        let friday = document["friday"] as! TimeSlotData
//                        let saturday = document["saturday"] as! TimeSlotData
//                        let documentId = document.documentID
//
//                        let newUser = UserData(document: document)
//
//                        self.userDatas.append(newUser)
//                    }
//                    //collectionViewをreload
//                    self.timeTableCllectionView.reloadData()
//                }
//            })
//        } else {
//            return
//        }
//    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 42 // 表示するセルの数
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) // 表示するセルを登録(先程命名した"Cell")
        cell.backgroundColor = .gray  // セルの色
        return cell
    }
    
    //segueの設定
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toClassmatesList", sender: nil)
        
    }
    
    //セルサイズの設定
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize{
        return CGSize(width: self.headingLabel.frame.size.width,height: self.headingVerticalLabel.frame.size.height)
    }
}



