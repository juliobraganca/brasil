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
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var enterButton: UIButton!
    
    @IBOutlet weak var countryLabel: UILabel!
    
    @IBOutlet weak var countryPickerView: UIPickerView!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var countryTextField: UITextField!
    
    @IBOutlet weak var editInformationButton: UIButton!
    
    @IBOutlet weak var saveInformationButton: UIButton!
    
    var welcomeText = "" {
        didSet {
            welcomeLabel.text = "Welcome to Brazil, \(welcomeText)"
        }
    }
    
    var embassyCountry = "usa"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        //        configTextFields()
        configLabels()
        configButtons()
    }
    
    //    @IBAction func tappedEditInformationButton(_ sender: Any) {
    //        let ac = UIAlertController(title: nil, message: "You can edit the fields", preferredStyle: .alert)
    //        ac.addAction(UIAlertAction(title: "OK", style: .default))
    //        present(ac, animated: true)
    //        editableFields()
    //        saveInformationButton.isHidden = false
    //        editInformationButton.isHidden = true
    //    }
    //
    //
    //    @IBAction func tappedSaveInformationButton(_ sender: Any) {
    //        let ac = UIAlertController(title: nil, message: "Information Saved!", preferredStyle: .alert)
    //        ac.addAction(UIAlertAction(title: "OK", style: .default))
    //        present(ac, animated: true)
    //        notEditableFields()
    //        editInformationButton.isHidden = false
    //        saveInformationButton.isHidden = true
    //        welcomeText = nameTextField.text ?? ""
    //    }
    
    
    func configLabels(){
        welcomeLabel.text = "Welcome to Brazil!"
        welcomeLabel.textAlignment = .center
        welcomeLabel.font = UIFont.boldSystemFont(ofSize: 17)
        
        //        nameLabel.text = "Name:"
        //
        //        countryLabel.text = "Country:"
        
        messageLabel.text = "Insert your country bellow to get information about embassy in Brazil"
    }
    
    func configButtons() {
        //        saveInformationButton.isHidden = true
        //        saveInformationButton.backgroundColor = .red
        //        saveInformationButton.tintColor = .white
        //
        //        editInformationButton.isHidden = false
        //        editInformationButton.backgroundColor = .red
        //        editInformationButton.tintColor = .white
        
        enterButton.setTitle("Enter", for: .normal)
        
    }
    
    //    func configTextFields(){
    //        notEditableFields()
    //
    //        //Assinando contratos
    //        nameTextField.delegate = self
    //        countryTextField.delegate = self
    //
    //        //Configurando Teclados
    //        nameTextField.keyboardType = .namePhonePad
    //        countryTextField.keyboardType = .namePhonePad
    //
    //        //Placeholder
    //        nameTextField.placeholder = "Insert your name"
    //        countryTextField.placeholder = "Insert your country"
    //    }
    //
    //    func notEditableFields() {
    //        nameTextField.isEnabled = false
    //        countryTextField.isEnabled = false
    //    }
    //
    //
    //    func editableFields() {
    //        nameTextField.isEnabled = true
    //        countryTextField.isEnabled = true
    //    }
    //}
    
    //extension HomeVC: UITextFieldDelegate {
    //    public func textFieldDidBeginEditing(_ textField: UITextField) {
    //        print("textFieldDidBeginEditing")
    //        textField.layer.borderWidth = 1.0
    //        textField.layer.borderColor = UIColor.blue.cgColor
    //    }
    //
    //    public func textFieldDidEndEditing(_ textField: UITextField) {
    //        print("textFieldDidEndEditing")
    //        textField.layer.borderWidth = 0
    //    }
    //
    //    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    //        print("textFieldShouldReturn")
    //        textField.resignFirstResponder()
    //        return true
    //    }
    }

