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

    @IBOutlet weak var subjectNameTextField: UITextField!
    
    @IBOutlet weak var professorNameTextField: UITextField!
    
    @IBOutlet weak var classRoomTextField: UITextField!
    
    var docRef: DocumentReference!
    
    @IBAction func saveSubjectButton(_ sender: Any) {
        
        guard let subjectName = subjectNameTextField.text, !subjectName.isEmpty else {return}
        guard let professorName = professorNameTextField.text, !professorName.isEmpty else {return}
        guard let classRoom = classRoomTextField.text, !classRoom.isEmpty else {return}
        
        docRef = db.collection("collegeClassData").addDocument(data: [
            "subject": subjectName,
            "professor": professorName,
            "classroom": classRoom
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(self.docRef!.documentID)")
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
