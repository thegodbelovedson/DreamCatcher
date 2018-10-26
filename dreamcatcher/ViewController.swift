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
            
            //            ini dugunakan pakai segue kalau mau passing parameter berarti harus bikin tanda nyambung type: i
//            self.performSegue(withIdentifier: "homeSegue", sender: nil)
            
//            kalau mau hilangin seguenya
            let storyboard = UIStoryboard(name: "Main", bundle: nil) // init nama project ini sebagai home
            if let homeViewController = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController { // ini untuk panggil homeviewcontroller ke dalam variabel dan variabelnya bisa dipakai function dan parameternnya
                homeViewController.username = username
                self.navigationController?.pushViewController(homeViewController, animated: true)// ini untuk perpindahan ke halamannya
            }
        }
    }
    
    //    ini satu paket kalau pakai segue harusnya bisa pilih salah satu type: ii
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

