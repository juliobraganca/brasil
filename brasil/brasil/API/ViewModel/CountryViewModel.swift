//
//  CountryViewModel.swift
//  brasil
//
//  Created by Julio Braganca on 16/12/23.
//

import UIKit

class CountryViewModel {
    
    var listEmbassyAbroadDetail: [EmbassyAbroadDetail] = []
    var activities: [Activity] = []
    var countryBriefData: CountryBriefData?
    
    private var service: CountryService = CountryService()
    
    func fetchEmbassyAbroad(source: String) {
        service.getEmbassyAbroadURLSession(source: source) { result in
            switch result {
            case .success(let success):
                print(success)
                self.listEmbassyAbroadDetail = success.data ?? []
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
    func fetchCountryActivities() {
        service.getCountryActivitiesURLSession { result in
            switch result {
            case .success(let success):
                print(success)
                self.activities = success.data?.activities ?? []
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
    func fetchCountryBrief() {
        service.getCountryBriefURLSession { result in
            switch result {
            case .success(let success):
                print(success.data ?? "deu ruim")
                self.countryBriefData = success.data
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    

}

