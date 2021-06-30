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
    
    var passCode :String{
        let pass = Int.random(in: 10000...99999)
        return String(pass)
    }
    
    @IBOutlet weak var codeSecretLbl: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

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

    @IBAction func codeTFChanged(_ sender: UITextField) {
    }
    
    
    private func isCodeValid(){
    }
    
    
    private func setupUI(){
        codeSecretLbl.text = passCode + "from \(email ?? "")"
        
    }
    
    
    }

