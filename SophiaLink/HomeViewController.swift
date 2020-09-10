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
    
    @IBOutlet weak var headingLabel: UILabel!
    
    @IBOutlet weak var headingVerticalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 42 // 表示するセルの数
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) // 表示するセルを登録(先程命名した"Cell")
        cell.backgroundColor = .gray  // セルの色
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
           layout collectionViewLayout: UICollectionViewLayout,
           sizeForItemAt indexPath: IndexPath) -> CGSize{
        return CGSize(width: headingLabel.frame.size.width,height: headingVerticalLabel.frame.size.height)
    }
}


