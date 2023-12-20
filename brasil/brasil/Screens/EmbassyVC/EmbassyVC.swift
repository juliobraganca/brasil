//
//  EmbassyVC.swift
//  brasil
//
//  Created by Julio Braganca on 16/12/23.
//

import UIKit

class EmbassyVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: EmbassyViewModel = EmbassyViewModel()
    var homeVC: HomeVC?
    
    var selectedEmbassy = "" {
        didSet {
            title = "Embassies of \(selectedEmbassy)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Embassies"
        viewModel.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let selectedCountry = homeVC?.selectedCountry {
            selectedEmbassy = selectedCountry
            viewModel.fetchEmbassyAbroad(source: selectedCountry.lowercased())
        } else {
            print("selectedCountry is nil")
        }
    }
    
    func configTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(EmbassyTableViewCell.nib(), forCellReuseIdentifier: EmbassyTableViewCell.identifier)
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
