//
//  LoginVC.swift
//  brasil
//
//  Created by Julio Braganca on 16/12/23.
//

import UIKit

class LoginVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var forgotPasswordButton: UIButton!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var orLabel: UILabel!
    
    @IBOutlet weak var gmailLoginButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configElements()

    }
    
    
    @IBAction func tappedLoginButton(_ sender: UIButton) {
        let homeVC = UIStoryboard(name: "HomeVC", bundle: nil).instantiateViewController(withIdentifier: "HomeVC") as? HomeVC
        
        let embassyVC = UIStoryboard(name: "EmbassyVC", bundle: nil).instantiateViewController(withIdentifier: "EmbassyVC") as? EmbassyVC
        
        let activitiesVC = UIStoryboard(name: "ActivitiesVC", bundle: nil).instantiateViewController(withIdentifier: "ActivitiesVC") as? ActivitiesVC
        
        self.navigationController?.pushViewController(TabBarController(), animated: true)
    }
    
    func configElements() {
        emailTextField.placeholder = "E-mail Adress"
        emailTextField.keyboardType = .emailAddress
        emailTextField.delegate = self
        
        passwordTextField.placeholder = "Password"
        passwordTextField.delegate = self
        passwordTextField.isSecureTextEntry = true
        
//        registerButton.setTitle("Cadastre-se", for: .normal)
//        registerButton.setTitleColor(UIColor.black, for: .normal)
//        
        forgotPasswordButton.setTitle("forgot Password?", for: .normal)
        
        loginButton.setTitle("Login", for: .normal)
        
    }
}
