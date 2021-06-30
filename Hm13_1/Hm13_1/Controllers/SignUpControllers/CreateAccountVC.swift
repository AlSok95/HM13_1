//
//  CreateAccountVC.swift
//  Hm13_1
//
//  Created by Анна on 27.06.2021.
//

import UIKit

class CreateAccountVC: UIViewController {

    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var emailErrorLbl: UILabel!
    
    @IBOutlet weak var passTF: UITextField!
    @IBOutlet weak var passErrorLbl: UILabel!
    
    @IBOutlet var verifPassView: [UIView]!
    
    @IBOutlet weak var confPassTF: UITextField!
    @IBOutlet weak var confPassErrorLbl: UILabel!
    
    @IBOutlet weak var signUpBtn: UIButton!
    
    private var isValidEmail = false
    private var passwordStrength: PasswordStrength = .veryWeak
    
    
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
    @IBAction func signinButtonTouch() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    
    @IBAction func emailTFChanged(_ sender: UITextField) {
        guard let email = sender.text else {return}
        isValidEmail = VerificationServices.isValidEmail(email: email)
        emailErrorLbl.isHidden = isValidEmail
    }
    
    				
    @IBAction func passTFChanged(_ sender: UITextField) {
        guard let pass = sender.text else {return}
        passwordStrength = VerificationServices.isValidPassword(pass: pass)
        passErrorLbl.isHidden = !(passwordStrength == .veryWeak)
        verifPassView.enumerated().forEach{ (index, view) in
            if (index <= (passwordStrength.rawValue - 1)){
                view.alpha = 1
            } else {
                view.alpha = 0.1
            }
        }}
    
    @IBAction func confPassTFChanged(_ sender: UITextField) {
    }
    
    
    
}

