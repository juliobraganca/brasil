//
//  EmbassyVC.swift
//  brasil
//
//  Created by Julio Braganca on 16/12/23.
//

import UIKit
import Firebase
import FacebookLogin

class EmbassyVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var exitButton: UIButton!
    
    var viewModel: EmbassyViewModel = EmbassyViewModel()
    var homeVC: HomeVC?
    var auth: Auth?
    var selectedEmbassy = "" {
        didSet {
            title = "Embassies of \(selectedEmbassy)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Embassies"
        viewModel.delegate = self
        self.auth = Auth.auth()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let selectedCountry = homeVC?.selectedCountry {
            selectedEmbassy = selectedCountry
            viewModel.fetchEmbassyAbroad(source: selectedCountry.lowercased())
        } else {
            print("selectedCountry is nil")
        }
        
    }
    
    
    
    @IBAction func tappedExitButton(_ sender: Any) {
        logoutFromFirebase()
        logoutFromFacebook()
        let loginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginVC") as? LoginVC
        navigationController?.pushViewController(loginVC ?? UIViewController(), animated: true)
        
    }
    
    func configTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(EmbassyTableViewCell.nib(), forCellReuseIdentifier: EmbassyTableViewCell.identifier)
    }
    
    func logoutFromFacebook() {
        let loginManager = LoginManager()
        loginManager.logOut()
    }
    
    func logoutFromFirebase(){
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
}

extension EmbassyVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EmbassyTableViewCell.identifier, for: indexPath) as? EmbassyTableViewCell
        cell?.setupCell(data: viewModel.getEmbassyList(indexPath: indexPath))
        return cell ?? UITableViewCell()
    }
}


extension EmbassyVC: EmbassyViewModelProtocol {
    func successRequest() {
        DispatchQueue.main.async {
            self.configTableView()
            self.tableView.reloadData()
        }
    }
    
    func errorRequest() {
        DispatchQueue.main.async {
            let ac = UIAlertController(title: nil, message: "No information was loaded", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(ac, animated: true)
        }
    }
}
