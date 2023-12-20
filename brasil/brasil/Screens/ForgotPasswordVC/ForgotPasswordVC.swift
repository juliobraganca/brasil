//
//  ForgotPasswordVC.swift
//  brasil
//
//  Created by Luana Mattana Damin on 18/12/23.
//

import UIKit
import Firebase

class ForgotPasswordVC: UIViewController {
    
    private var viewModel: ForgotPasswordViewModel = ForgotPasswordViewModel()
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var forgotPasswordLabel: UILabel!
    @IBOutlet weak var recoverButton: UIButton!
    @IBOutlet weak var retunButton: UIButton!
    
    var auth: Auth?
    var alert: Alert?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configElements()
        self.auth = Auth.auth()
        navigationController?.navigationBar.isHidden = true
        self.alert = Alert(controller: self)
    }
    
    
    func configElements() {
        
        emailTextField.placeholder = "Your e-mail Address"
        emailTextField.keyboardType = .emailAddress
        emailTextField.delegate = self
        
        forgotPasswordLabel.text = "Forgot your Password?"
        
        recoverButton.setTitle("Recover", for: .normal)
    }
    
    
    @IBAction func tappedReturnButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: false)
    }
    
    @IBAction func tappedRecoverButton(_ sender: Any) {
        if self.emailTextField.validateEmail() {
            let email:String = emailTextField.text ?? ""
            auth?.sendPasswordReset(withEmail: email) { (error) in
                if error != nil {
                    self.alert?.getAlert(title: AlertStrings.atention.rawValue, message: AlertStrings.errorEmailForgot.rawValue)
                } else {
             
                    self.alert?.getAlert(title: AlertStrings.atention.rawValue, message: AlertStrings.successEmailForgot.rawValue)
                }
            }
        } else {
            self.alert?.getAlert(title: AlertStrings.atention.rawValue, message: AlertStrings.errorEmaiDdataForgot.rawValue)
        }
    }
}

extension ForgotPasswordVC: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.systemBlue.cgColor
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 0
        textField.layer.borderColor = UIColor.gray.cgColor
    }
}

extension UITextField {
    func validateEmail() -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let validateRegex = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return validateRegex.evaluate (with: self.text)
    }
}
