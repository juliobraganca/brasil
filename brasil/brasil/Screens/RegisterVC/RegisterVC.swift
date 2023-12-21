//
//  RegisterVC.swift
//  brasil
//
//  Created by Luana Mattana Damin on 18/12/23.
//

import UIKit
import Firebase
import IQKeyboardManagerSwift

class RegisterVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var createAccountLabel: UILabel!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var nacionalityTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var registerButton: UIButton!
    
    var auth: Auth?
    var alert: Alert?
    var isNameFieldValid = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.auth = Auth.auth()
        self.alert = Alert(controller: self)
        configElements()
    }
    
    func configElements() {
        
        nameTextField.placeholder = "Your full name"
        nameTextField.delegate = self
        nameTextField.tag = 0
        
        nacionalityTextField.placeholder = "Your nacionality"
        nacionalityTextField.delegate = self
        nacionalityTextField.isEnabled = true
        nacionalityTextField.tag = 1
        
        emailTextField.placeholder = "Your e-mail Address"
        emailTextField.keyboardType = .emailAddress
        emailTextField.delegate = self
        emailTextField.isEnabled = false
        emailTextField.tag = 2
        
        passwordTextField.placeholder = "Your Password"
        passwordTextField.delegate = self
        passwordTextField.isSecureTextEntry = true
        passwordTextField.textContentType = .oneTimeCode
        passwordTextField.isEnabled = false
        passwordTextField.tag = 3
        
        createAccountLabel.text = "Create Your Account"
        
        registerButton.setTitle("Register", for: .normal)
        registerButton.isEnabled = false
        enableIQKeyboardManager()
    }
    func enableIQKeyboardManager() {
        IQKeyboardManager.shared.enable = true
        
        nameTextField.delegate = self
        nameTextField.addDoneOnKeyboard()
        
        nacionalityTextField.delegate = self
        nacionalityTextField.addDoneOnKeyboard()
        
        emailTextField.delegate = self
        emailTextField.addDoneOnKeyboard()
        
        passwordTextField.delegate = self
        passwordTextField.addDoneOnKeyboard()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case nameTextField:
            handleNameFieldValidation()
        case nacionalityTextField:
            handleNacionalityFieldValidation()
        case emailTextField:
            handleEmailFieldValidation()
        case passwordTextField:
            handlePasswordFieldValidation()
        default:
            break
        }
        return true
    }
    func handleNameFieldValidation() {
        
    }
    
    func handleNacionalityFieldValidation() {
        
    }
    
    func handleEmailFieldValidation() {
        
    }
    
    func handlePasswordFieldValidation() {
        
    }
    
    @IBAction func tappedRegisterButton(_ sender: Any) {
        let email: String = self.emailTextField.text ?? ""
        let password: String = self.passwordTextField.text ?? ""
        auth?.createUser(withEmail:email, password: password, completion: { (Result, error) in
            if error != nil {
                self.alert?.getAlert(title: AlertStrings.atention.rawValue, message: AlertStrings.errorRegister.rawValue)
            } else{
                self.alert?.getAlert(title: AlertStrings.congratulations.rawValue, message: AlertStrings.sucessRegister.rawValue)
            }
        })
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // Logic when text field begins editing
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.systemBlue.cgColor
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 0
        textField.layer.borderColor = UIColor.gray.cgColor
        
        switch textField.tag {
        case 0:
            isNameFieldValid = textField.validateName()
            if isNameFieldValid {
                nacionalityTextField.isEnabled = true
                nacionalityTextField.becomeFirstResponder()
            } else {
                nacionalityTextField.isEnabled = false
                alert?.getAlert(title: AlertStrings.atention.rawValue, message: AlertStrings.errorName.rawValue)
            }
        case 1:
            let isNacionalityValid = textField.validateNationality()
            if isNacionalityValid {
                emailTextField.isEnabled = true
                emailTextField.becomeFirstResponder()
                // Optionally, enable or disable alerts/messages here based on validation
            } else {
                emailTextField.isEnabled = false
                alert?.getAlert(title: AlertStrings.atention.rawValue, message: AlertStrings.errorNational.rawValue)
            }
        case 2:
            let isEmailValid = textField.validateEmail()
            if isEmailValid {
                passwordTextField.isEnabled = true
                passwordTextField.becomeFirstResponder()
                // Optionally, enable or disable alerts/messages here based on validation
            } else {
                passwordTextField.isEnabled = false
                alert?.getAlert(title: AlertStrings.atention.rawValue, message: AlertStrings.errorEmail.rawValue)
            }
        case 3:
            let isPasswordValid = textField.validatePassword()
            if isPasswordValid {
                registerButton.isEnabled = true
                // Optionally, enable or disable alerts/messages here based on validation
            } else {
                registerButton.isEnabled = false
                alert?.getAlert(title: AlertStrings.atention.rawValue, message: AlertStrings.errorPassword.rawValue)
            }
        default:
            break
        }
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
        let emailRegex = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}$"
        let emailValidation = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailValidation.evaluate(with: self.text)
    }
    func validateNationality() -> Bool {
        let nationalityRegex = "^[a-zA-Z]{2,}$"
        let nationalityValidation = NSPredicate(format: "SELF MATCHES %@", nationalityRegex)
        return nationalityValidation.evaluate(with: self.text)
    }
    
    func validatePassword() -> Bool {
        let passwordRegex = ".{6,}"
        let passwordValidation = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return passwordValidation.evaluate(with: self.text)
    }
    func validateName() -> Bool {
        let passwordRegex = "^[a-zA-Z]{2,}$"
        let validateRegex = NSPredicate (format: "SELF MATCHES %@", passwordRegex)
        return validateRegex.evaluate(with: self.text)
    }
}

extension UITextField {
    func addDoneOnKeyboard() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTapped))
        
        toolbar.items = [flexibleSpace, doneButton]
        self.inputAccessoryView = toolbar
    }
    
    @objc func doneButtonTapped() {
        self.resignFirstResponder()
    }
}




