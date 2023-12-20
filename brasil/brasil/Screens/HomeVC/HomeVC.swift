//
//  ViewController.swift
//  brasil
//
//  Created by Julio Braganca on 16/12/23.
//


import UIKit

class HomeVC: UIViewController {
    
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet weak var countryPickerView: UIPickerView!
    
    @IBOutlet weak var enterButton: UIButton!
    
    var welcomeText = "" {
        didSet {
            welcomeLabel.text = "Welcome to Brazil, \(welcomeText)"
        }
    }
    var selectedCountry: String?
    let countries = ["USA",
                     "Turkey",
                     "Israel",
                     "China",
                     "France",
                     "Portugal",
                     "Russia"
    
]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        //        configTextFields()
        countryPickerView.dataSource = self
        countryPickerView.delegate = self
        configLabels()
        configButtons()
    }
    
    @IBAction func tappedEnterButton(_ sender: Any) {
        selectedCountry = countries[countryPickerView.selectedRow(inComponent: 0)]
        showEmbassyVC()
    }

    func showEmbassyVC() {
        let embassyVC = UIStoryboard(name: "EmbassyVC", bundle: nil).instantiateViewController(withIdentifier: "EmbassyVC") as? EmbassyVC
        embassyVC?.homeVC = self
        navigationController?.pushViewController(embassyVC ?? UIViewController(), animated: true)
    }
    
    func configLabels(){
        welcomeLabel.text = "Welcome to Brazil!"
        welcomeLabel.textAlignment = .center
        welcomeLabel.font = UIFont.boldSystemFont(ofSize: 17)
        messageLabel.text = "Chose your country bellow to get information about embassy in Brazil"
    }
    
    func configButtons() {
        enterButton.setTitle("Enter", for: .normal)
    }
}

extension HomeVC: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countries.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return countries[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedCountry = countries[row]
    }
}

