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
    
    @IBOutlet weak var accountLabel: UILabel!
    
    @IBOutlet weak var gmailLoginButton: UIButton!
    
    @IBOutlet weak var facebookLoginButton: UIButton!
    
    @IBOutlet weak var registerButton: UIButton!
    
    
    
    
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
        
        orLabel.text = "or"
        
        accountLabel.text = "Don't have an account?"
        
        registerButton.setTitle("Sign in", for: .normal)
        
        forgotPasswordButton.setTitle("forgot Password?", for: .normal)
        
        loginButton.setTitle("Login", for: .normal)
        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.systemBlue.cgColor
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 0
        textField.layer.borderColor = UIColor.gray.cgColor
    }
}
