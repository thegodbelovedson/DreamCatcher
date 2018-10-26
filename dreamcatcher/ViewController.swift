//
//  ViewController.swift
//  dreamcatcher
//
//  Created by Nakama on 26/10/18.
//  Copyright © 2018 Nakama. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var headerLabel: UILabel!
    
    override func viewDidLoad() {	
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        performSegue(withIdentifier: "signUpSegue", sender: self)
    }

    @IBAction func submitButton(_ sender: Any) {
//        if !(usernameField.text?.isEmpty ?? true) && !(passwordField.text?.isEmpty ?? true){
//            headerLabel.text = "Hello \(usernameField.text!    )"
//
//            self.performSegue(withIdentifier: "homeSegue", sender: nil)
//        } else {
//            headerLabel.text = "Type username first"
//        }
        
        if let username = usernameField.text,
            let pass = passwordField.text,
            !username.isEmpty,
            !pass.isEmpty{
            
            self.performSegue(withIdentifier: "homeSegue", sender: nil)
            
//            kalau mau hilangin seguenya
//            let homeViewController = HomeViewController()
//            let navigationController = UINavigationController(rootViewController: homeViewController)
//            self.navigationController?.pushViewController(navigationController, animated: true)
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewconttroller = segue.destination as? HomeViewController{
            viewconttroller.username=usernameField.text
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {

        if identifier == "homeSegue"{
            if let username = usernameField.text,
                let pass = passwordField.text,
                !username.isEmpty,
                !pass.isEmpty{
                return true
            }
        }
        
        return false
    }
    
}

