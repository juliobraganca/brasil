//
//  LoginVC.swift
//  brasil
//
//  Created by Julio Braganca on 16/12/23.
//

import UIKit

class LoginVC: UIViewController {
    
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loginButton.setTitle("Login", for: .normal)
    }
    
    
    @IBAction func tappedLoginButton(_ sender: UIButton) {
        self.navigationController?.pushViewController(HomeVC(), animated: true)
    }
    
}
