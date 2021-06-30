//
//  WelcomeVC.swift
//  Hm13_1
//
//  Created by Анна on 30.06.2021.
//

import UIKit

class WelcomeVC: UIViewController {
    var email:String?
    var name:String?
    var pass:String?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    @IBAction func continueBtnTapped() {
        guard let email = email,
              let name = name ,
              let pass = pass else {return}
        UserDefaults.standard.set(name, forKey: Constants.name)
        UserDefaults.standard.set(email, forKey: Constants.email)
        UserDefaults.standard.set(pass, forKey: Constants.pass)
        navigationController?.popToRootViewController(animated: true)
    }
    
    
}
