//
//  SignInVC.swift
//  Hm13_1
//
//  Created by Анна on 26.06.2021.
//

import UIKit

class SignInVC: UIViewController {
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passTF: UITextField!
    @IBOutlet weak var userErrorLbl: UILabel!
    @IBOutlet weak var signInOutlet: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func signInTapped() {
        guard let email = emailTF.text,
             
              let pass = passTF.text else {return}
        if checkUser(email:email, pass:pass){
            print("GOOOOOOOOO!!!")
        }
    }
    
    private func checkUser(email:String, pass:String)-> Bool{
        
        let passSaved = UserDefaults.standard.object(forKey: Constants.pass) as! String
        let emailSaved = UserDefaults.standard.object(forKey: Constants.email) as! String
        let userFound = (email == emailSaved) && (pass == passSaved)
        userErrorLbl.isHidden = userFound
        return userFound
        
    }
        
    }

