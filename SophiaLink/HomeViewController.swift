//
//  HomeViewController.swift
//  SophiaLink
//
//  Created by 五十嵐慎吉 on 2020/09/04.
//  Copyright © 2020 五十嵐慎吉. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var timeTableCllectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let layout = UICollectionViewFlowLayout()
            layout.itemSize = CGSize(width: 50, height: 50)
            layout.minimumInteritemSpacing = 2
            timeTableCllectionView.collectionViewLayout = layout
        }
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 42 // 表示するセルの数
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) // 表示するセルを登録(先程命名した"Cell")
            cell.backgroundColor = .gray  // セルの色
            return cell
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


