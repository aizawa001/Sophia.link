//
//  SignUpViewController.swift
//  SophiaLink
//
//  Created by 五十嵐慎吉 on 2020/09/06.
//  Copyright © 2020 五十嵐慎吉. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SignUpViewController: UIViewController {
    
    
    @IBOutlet weak var userNameText: UITextField!
    
    @IBOutlet weak var emailText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    
    @IBOutlet weak var secondPasswordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func login(_ sender: Any) {
    }
    
    @IBAction func signUp(_ sender: Any) {
        
        //email,password,nameをそれぞれアンラップする
        guard let email = emailText.text else {return}
        guard let password = passwordText.text else {return}
        guard let name = userNameText.text else {return}
        guard let secondPassword = secondPasswordText.text else {return}
        
        //passwordが一致していなかった場合にアラートを表示
        if password != secondPassword {
            let alertController = UIAlertController(title: "Alert", message: "Confirmation password does not match", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(cancelAction)
            alertController.popoverPresentationController?.sourceView = view
            present(alertController, animated: true, completion: nil)
        } else {
        
        //新しくuserを作成する。emailとpasswordを引数に指定し、その後useridを用いてクロージャーを実行。
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            
            if let error = error {
                print(error)
                return
            }
            
            guard let userId = authResult?.user.uid else {return}
            
            Firestore.firestore().collection("userData").document(userId).setData([
                "name": name
            ],completion:{(error) in
                if let error = error {
                    print(error)
                    return
                } else {
                    //画面遷移
                    self.performSegue(withIdentifier: "goHome", sender: nil)
                }
                
            }
            )
        }
    }
    }
}
