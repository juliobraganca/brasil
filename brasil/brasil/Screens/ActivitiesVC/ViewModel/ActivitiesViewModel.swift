//
//  ActivitiesViewModel.swift
//  brasil
//
//  Created by Julio Braganca on 17/12/23.
//

import Foundation

protocol ActivitiesViewModelProtocol: AnyObject {
    func successRequest()
    func errorRequest()
}

class ActivitiesViewModel {
    
    var countryActivities: CountryActivities?
    private var service: ActivitiesService = ActivitiesService()
    weak var delegate: ActivitiesViewModelProtocol?

    func fetchCountryActivities() {
        service.getCountryActivitiesURLSession { result in
            switch result {
            case .success(let success):
                print(success)
                self.countryActivities = success
                self.delegate?.successRequest()
            case .failure(_):
                self.delegate?.errorRequest()
            }
        }
    }
    
    func numberOfRows() -> Int {
        return countryActivities?.data?.activities?.count ?? 0
    }
    
    func getActivitiesList(indexPath: IndexPath) -> Activity {
        return countryActivities?.data?.activities?[indexPath.row] ?? Activity(title: "", activity: "")
    }
}
