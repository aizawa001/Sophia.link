//
//  ClassmatesListViewController.swift
//  SophiaLink
//
//  Created by 五十嵐慎吉 on 2020/09/09.
//  Copyright © 2020 五十嵐慎吉. All rights reserved.
//

import UIKit

class StudentsListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var subjectLabel: UILabel!
    
    @IBOutlet weak var studentsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell"){
            return cell
        }
    }

   

}
