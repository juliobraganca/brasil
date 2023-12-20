//
//  LoginVC.swift
//  brasil
//
//  Created by Julio Braganca on 16/12/23.
//

import UIKit
import Firebase
import GoogleSignIn



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
    
    var auth: Auth?
    
    private var viewmodel: LoginViewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.auth = Auth.auth()
        configElements()
        
    }
    
    @IBAction func tappedForgotPasswordButton(_ sender: UIButton) {
        let forgotPasswordScreen = UIStoryboard(name: "ForgotPasswordVC", bundle: nil).instantiateViewController(withIdentifier: "ForgotPasswordVC") as? ForgotPasswordVC
        navigationController?.pushViewController(forgotPasswordScreen ?? UIViewController(), animated: true)
    }
    
    @IBAction func tappedRegisterButton(_ sender: UIButton) {
        
        
                let registerScreen = UIStoryboard(name: "RegisterVC", bundle: nil).instantiateViewController(withIdentifier: "RegisterVC") as? RegisterVC
                navigationController?.pushViewController(registerScreen ?? UIViewController(), animated: true)
            }
    
    @IBAction func tappedLoginButton(_ sender: UIButton) {
        guard let email = emailTextField.text, let password = passwordTextField.text else {
            return
        }
        viewmodel.signIn(email: email, password: password) { [weak self] success, errorMessage in
            guard let self = self else { return }
            if success {
                self.navigationController?.pushViewController(TabBarController(), animated: true)
            } else {
                print("Deu ruim!")
            }
        }
    }
    
    @IBAction func tappedGmailLogin(_ sender: Any) {
        
        viewmodel.signInWithGoogle(presentingViewController: self) { success in
            if success {
                DispatchQueue.main.async {
                    self.navigationController?.pushViewController(TabBarController(), animated: true)
                }
            } else {
                print("falha ao autenticar")
            }
        }
    }
    


    func configElements() {
        emailTextField.placeholder = "E-mail Address"
        emailTextField.keyboardType = .emailAddress
        emailTextField.delegate = self
        
        passwordTextField.placeholder = "Password"
        passwordTextField.delegate = self
        passwordTextField.isSecureTextEntry = true
        
        orLabel.text = "or"
        
        accountLabel.text = "Don't have an account?"
        
        registerButton.setTitle("Sign up", for: .normal)
        
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
