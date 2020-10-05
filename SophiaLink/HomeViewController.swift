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
//詰め込みたい配列が必要です。


    
    @IBOutlet weak var timeTableCllectionView: UICollectionView!
    
    @IBOutlet weak var headingLabel: UILabel!
    
    @IBOutlet weak var headingVerticalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    override func viewWillAppear(_ animated: Bool) {
        //こんなイメージです
        handle = Auth.auth().addStateDidChangeListener({ (auth, user) in
            if user == nil{
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let loginVC = storyboard.instantiateViewController(withIdentifier: "ログインさせたいページ")
                self.present(loginVC, animated: true)
            } else {
//ログイン監視する関数を呼ぶ
//                self.setListener()
            }
        })

    }


////監視する関数
//    func setListener() {
//必要なコレクションのスナップショットを取得
//                .addSnapshotListener({ (snapshot, err) in
//                    if let error = err{
//                        print(error)
//                    }else{
//                        配列を削除して
//                        配列にsnapshotでdata取得して
//                        reloadします。


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
        performSegue(withIdentifier: "toClassmatesList", sender: nil)

    }
    
    //セルサイズの設定
    func collectionView(_ collectionView: UICollectionView,
           layout collectionViewLayout: UICollectionViewLayout,
           sizeForItemAt indexPath: IndexPath) -> CGSize{
        return CGSize(width: headingLabel.frame.size.width,height: headingVerticalLabel.frame.size.height)
    }
}


