//
//  Extensions.swift
//  brasil
//
//  Created by Eduardo on 21/12/23.
//

import Foundation
import UIKit


extension UITextField {
    func validateEmail() -> Bool {
        guard let text = self.text else { return false }
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let validateRegex = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return validateRegex.evaluate(with: text)
    }
    func validateNationality() -> Bool {
        guard let text = self.text else { return false }
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let validateRegex = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return validateRegex.evaluate(with: text)
    }
    
    func validatePassword() -> Bool {
        guard let text = self.text else { return false }
        let passwordRegex = ".{6,}"
        let validateRegex = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return validateRegex.evaluate(with: text)
    }
    
    func validateName() -> Bool {
        guard let text = self.text else { return false }
        let nameRegex = "^[a-zA-Z]{2,}$"
        let validateRegex = NSPredicate(format: "SELF MATCHES %@", nameRegex)
        return validateRegex.evaluate(with: text)
    }
}
