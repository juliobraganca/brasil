//
//  LogionViewModel.swift
//  brasil
//
//  Created by Eduardo on 20/12/23.
//

import Foundation
import Firebase


class LoginViewModel {
        
        func signIn(email: String, password: String, completion: @escaping (Bool, String?) -> Void) {
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] (user, error) in
                guard self != nil else { return }
                if let error = error {
                    completion(false, error.localizedDescription)
                } else {
                    completion(true, nil)
                }
            }
        }
    }

    

