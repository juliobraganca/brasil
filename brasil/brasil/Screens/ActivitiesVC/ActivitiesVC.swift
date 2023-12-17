//
//  ActivitiesVC.swift
//  brasil
//
//  Created by Julio Braganca on 16/12/23.
//

import UIKit

class ActivitiesVC: UIViewController {

    
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: ActivitiesViewModel = ActivitiesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Activities"
        viewModel.delegate = self
        viewModel.fetchCountryActivities()
    }
    
    func configTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(ActivitiesTableViewCell.nib(), forCellReuseIdentifier: ActivitiesTableViewCell.identifier)
    }
}

extension ActivitiesVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ActivitiesTableViewCell.identifier, for: indexPath) as? ActivitiesTableViewCell
        cell?.setupCell(data: viewModel.getActivitiesList(indexPath: indexPath))
        return cell ?? UITableViewCell()
    }
}

extension ActivitiesVC: ActivitiesViewModelProtocol {
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
