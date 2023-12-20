//
//  LogionViewModel.swift
//  brasil
//
//  Created by Eduardo on 20/12/23.
//

import Foundation
import Firebase
import GoogleSignIn


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
    
    func signInWithGoogle(presentingViewController: UIViewController, completion: @escaping (Bool) -> Void) {
            guard let clientID = FirebaseApp.app()?.options.clientID else {
                completion(false)
                return
            }
            
            let config = GIDConfiguration(clientID: clientID)
            GIDSignIn.sharedInstance.configuration = config
            
            GIDSignIn.sharedInstance.signIn(withPresenting: presentingViewController) { result, error in
                guard error == nil else {
                    completion(false)
                    return
                }
                
               print("Login com sucesso")
                
                completion(true)
            }
        }
}
    

