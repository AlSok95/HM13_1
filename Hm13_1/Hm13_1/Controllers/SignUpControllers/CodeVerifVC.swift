//
//  CodeVerifVC.swift
//  Hm13_1
//
//  Created by Анна on 30.06.2021.
//

import UIKit

class CodeVerifVC: UIViewController {
    
    var email:String?
    var name:String?
    var pass:String?
    
    var generatorPassCode :String{
        let pass = Int.random(in: 10000...99999)
        return String(pass)
    }
    
    @IBOutlet weak var codeSecretLbl: UILabel!
    var passCode:String?

    override func viewDidLoad() {
        super.viewDidLoad()
        passCode = generatorPassCode
        setupUI()

        // Do any additional setup after loading the view.
    }
    

   
    // MARK: - Navigation

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let email = email,
              let name = name ,
              let pass = pass,
              let destVC = segue.destination as? WelcomeVC

        else {return}
        destVC.name = name
        destVC.email = email
        destVC.pass = pass
       
    }
    

    @IBAction func codeTFChanged(_ sender: UITextField) {
        guard let code = passCode,
              let ourCode = sender.text   else {
            return}
        if isCodeValid(code: code, ourCode: ourCode) {
            performSegue(withIdentifier: "showWelcomeVC", sender: nil)
            
        }
        }
        
        
        
        
    
    
    
    private func isCodeValid(code:String, ourCode:String)-> Bool{
        return code == ourCode
    }
    
    
    private func setupUI(){
        codeSecretLbl.text = (passCode ?? "") + " from \(email ?? "")"
        
    }
    
    
    }

