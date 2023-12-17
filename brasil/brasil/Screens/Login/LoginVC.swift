//
//  LoginVC.swift
//  brasil
//
//  Created by Julio Braganca on 16/12/23.
//

import UIKit

class LoginVC: UIViewController {
    
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loginButton.setTitle("Login", for: .normal)
    }
    
    
    @IBAction func tappedLoginButton(_ sender: UIButton) {
        let homeVC = UIStoryboard(name: "HomeVC", bundle: nil).instantiateViewController(withIdentifier: "HomeVC") as? HomeVC
        
        let embassyVC = UIStoryboard(name: "EmbassyVC", bundle: nil).instantiateViewController(withIdentifier: "EmbassyVC") as? EmbassyVC
        
        let activitiesVC = UIStoryboard(name: "ActivitiesVC", bundle: nil).instantiateViewController(withIdentifier: "ActivitiesVC") as? ActivitiesVC
        
        self.navigationController?.pushViewController(embassyVC ?? UIViewController(), animated: true)
    }
    
}
