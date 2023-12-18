//
//  ForgotPasswordVC.swift
//  brasil
//
//  Created by Luana Mattana Damin on 18/12/23.
//

import UIKit

class ForgotPasswordVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var forgotPasswordLabel: UILabel!
    
    @IBOutlet weak var recoverButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configElements()
    }
    
    
    func configElements() {
        
        forgotPasswordLabel.text = "Forgot your Password?"
        
        emailTextField.placeholder = "Your e-mail Address"
        emailTextField.keyboardType = .emailAddress
        emailTextField.delegate = self
        
        recoverButton.setTitle("Register", for: .normal)
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

