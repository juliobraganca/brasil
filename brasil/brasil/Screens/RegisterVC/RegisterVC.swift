//
//  RegisterVC.swift
//  brasil
//
//  Created by Luana Mattana Damin on 18/12/23.
//

import UIKit
import Firebase



class RegisterVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var createAccountLabel: UILabel!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var nacionalityTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var registerButton: UIButton!
    
    var auth: Auth?
    var alert: Alert?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.auth = Auth.auth()
        self.alert = Alert(controller: self)
        configElements()
        
    }
    
    func configElements() {
        
        nameTextField.placeholder = "Your full name"
        nameTextField.delegate = self
        
        nacionalityTextField.placeholder = "Your nacionality"
        nacionalityTextField.delegate = self
        
        emailTextField.placeholder = "Your e-mail Address"
        emailTextField.keyboardType = .emailAddress
        emailTextField.delegate = self
        
        passwordTextField.placeholder = "Your Password"
        passwordTextField.delegate = self
        passwordTextField.isSecureTextEntry = true
        
        createAccountLabel.text = "Create Your Account"
        
        registerButton.setTitle("Register", for: .normal)
    }
    
    
    @IBAction func tappedRegisterButton(_ sender: Any) {
        let email: String = self.emailTextField.text ?? ""
        let password: String = self.passwordTextField.text ?? ""
        auth?.createUser(withEmail:email, password: password, completion: { (Result, error) in
            if error != nil {
                self.showAlert(title: "Atenção", message: "Erro ao cadastrar. Verifique seus dados")
            } else{
                self.ShowAlertReturnLogin(title:"Parabéns", message: "Registro realizado com sucesso!")
                
            }
        })
        
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.systemBlue.cgColor
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 0
        textField.layer.borderColor = UIColor.gray.cgColor
    }
    
    
    
    func showAlert(title:String, message: String) {
        let alertController: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton: UIAlertAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(okButton)
        self.present(alertController,animated: true, completion: nil)
    }
    
    func ShowAlertReturnLogin(title: String, message: String){
        let alertController: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertControllerReturnLogin: UIAlertAction = UIAlertAction(title: "OK", style: .default) {(action) in
            self.redirectForLogin()
        }
        alertController.addAction(alertControllerReturnLogin)
        self.present(alertController,animated: true, completion: nil)
    }
    
    func redirectForLogin(){
        self.navigationController?.pushViewController(TabBarController(), animated: true)
    }
    
}

extension UITextField {
func validateEmail() -> Bool {
    let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    let validateRegex = NSPredicate(format: "SELF MATCHES %@", emailRegex)
    return validateRegex.evaluate (with: self.text)
}
func validatePassword() -> Bool {
    let passwordRegex = ".{6,}"
    let validateRegex = NSPredicate (format: "SELF MATCHES %@", passwordRegex)
    return validateRegex.evaluate(with: self.text)
    
}
func validateName() -> Bool {
    let passwordRegex = "^[a-zA-Z]{2,}$"
    let validateRegex = NSPredicate (format: "SELF MATCHES %@", passwordRegex)
    return validateRegex.evaluate(with: self.text)
}
}




