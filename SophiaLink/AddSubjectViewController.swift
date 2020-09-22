//
//  SettingSubjectViewController.swift
//  SophiaLink
//
//  Created by 五十嵐慎吉 on 2020/09/11.
//  Copyright © 2020 五十嵐慎吉. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseFirestore

class AddSubjectViewController: UIViewController{

    let db = Firestore.firestore()

    var collegeClassData:CollegeClassData?


    @IBOutlet weak var subjectNameTextField: UITextField!
    
    @IBOutlet weak var professorNameTextField: UITextField!
    
    @IBOutlet weak var classRoomTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func saveSubjectButton(_ sender: Any) {
        
        guard let subjectName = subjectNameTextField.text, !subjectName.isEmpty else {return}
        guard let professorName = professorNameTextField.text, !professorName.isEmpty else {return}
        guard let classRoom = classRoomTextField.text, !classRoom.isEmpty else {return}

        //戻値(docRef)何も使っていないため不必要
        //docRef = db.collection("collegeClassData").addDocument(data: [

        db.collection("collegeClassData").addDocument(data: [
            "subject": subjectName,
            "professor": professorName,
            "classroom": classRoom
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                //遷移元画面(SetSubjectsViewController)に戻る
                self.navigationController?.popViewController(animated: true)
            }
        }
        
    }
    

}
