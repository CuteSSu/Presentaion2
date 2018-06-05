//
//  ViewController.swift
//  SUMIN_Cosmetics
//
//  Created by SWUCOMPUTER on 2018. 6. 5..
//  Copyright © 2018년 SWUCOMPUTER. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var loginUserid: UITextField!
    @IBOutlet var loginPasswd: UITextField!
    @IBOutlet var labelStatus: UILabel!
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.loginUserid{
            textField.resignFirstResponder()
            self.loginPasswd.becomeFirstResponder()
        }
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func login() {
        self.performSegue(withIdentifier: "toLoginSuccess", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
