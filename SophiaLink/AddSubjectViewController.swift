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
    
    @IBOutlet weak var subjectNameTextField: UITextField!
    
    @IBOutlet weak var professorNameTextField: UITextField!
    
    @IBOutlet weak var classRoomTextField: UITextField!
    
    var docRef: DocumentReference!
    
    @IBAction func saveSubjectButton(_ sender: Any) {
        guard let subjectName = subjectNameTextField.text, !subjectName.isEmpty else {return}
        guard let professorName = professorNameTextField.text, !professorName.isEmpty else {return}
        guard let classRoom = classRoomTextField.text, !classRoom.isEmpty else {return}
        let dataToSave: [String: Any] = ["subject": subjectName, "professor": professorName, "classroom": classRoom]
        docRef.setData(dataToSave) { (error) in
            if let error = error {
                print("Oh no! Got an error: \(error.localizedDescription)")
            }else{
                print("Data has been saved!")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        docRef = Firestore.firestore().document("collegeClassData/CollegeClass")
    }
}
