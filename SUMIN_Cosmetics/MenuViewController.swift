//
//  MenuViewController.swift
//  SUMIN_Cosmetics
//
//  Created by SWUCOMPUTER on 2018. 6. 5..
//  Copyright © 2018년 SWUCOMPUTER. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    @IBAction func buttonLogout(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let loginView = storyboard.instantiateViewController(withIdentifier: "LoginView")
        self.present(loginView, animated: true, completion: nil)
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
