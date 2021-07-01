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
    
    @IBOutlet weak var nameTF: UITextField!
    
    @IBOutlet weak var passTF: UITextField!
    @IBOutlet weak var passErrorLbl: UILabel!
    
    @IBOutlet var verifPassView: [UIView]!
    
    @IBOutlet weak var confPassTF: UITextField!
    @IBOutlet weak var confPassErrorLbl: UILabel!
    
    @IBOutlet weak var signUpBtn: UIButton!
    
    private var isValidEmail = false
    private var isConfPass = false
    private var passwordStrength: PasswordStrength = .veryWeak
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let email = emailTF.text,
              let name = nameTF.text ,
              let pass = passTF.text,
              let destVC = segue.destination as? CodeVerifVC

        else {return}
        destVC.name = name
        destVC.email = email
        destVC.pass = pass
            
        }
    
    
    @IBAction func signinButtonTouch() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    
    @IBAction func emailTFChanged(_ sender: UITextField) {
        guard let email = sender.text else {return}
        isValidEmail = VerificationServices.isValidEmail(email: email)
        emailErrorLbl.isHidden = isValidEmail
        updateBtnState()
    }
    
    				
    @IBAction func passTFChanged(_ sender: UITextField) {
        guard let pass1 = sender.text else {return}
        passwordStrength = VerificationServices.isValidPassword(pass: pass1)
        passErrorLbl.isHidden = !(passwordStrength == .veryWeak)
        verifPassView.enumerated().forEach{ (index, view) in
            if (index <= (passwordStrength.rawValue - 1)){
                view.alpha = 1
            } else {
                view.alpha = 0.1
            }
        }
        guard let pass2 = confPassTF.text else {return}
        updatePassErrorLbl(pass1: pass1, pass2: pass2)
       
        
        updateBtnState()
    }
    
    @IBAction func confPassTFChanged(_ sender: UITextField) {
        guard let pass1 = passTF.text,
              let pass2 = sender.text else {return}
        updatePassErrorLbl(pass1: pass1, pass2: pass2)
      
        
        updateBtnState()
    }
    
    
    
    private func updatePassErrorLbl(pass1:String,pass2:String){
        isConfPass = VerificationServices.isPassCofirm(pass1: pass1, pass2: pass2)

        confPassErrorLbl.isHidden =  isConfPass
    }
    
    private func updateBtnState(){
        signUpBtn.isEnabled = isValidEmail &&
            isConfPass && (passwordStrength != .veryWeak)
        
    }
    
    
    @IBAction func signUpTouch(_ sender: UIButton) {
        performSegue(withIdentifier: "showCodeVerVC", sender: nil)
    }
   
}

	
