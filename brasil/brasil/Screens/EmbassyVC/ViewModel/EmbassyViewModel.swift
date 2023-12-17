//
//  EmbassyViewModel.swift
//  brasil
//
//  Created by Julio Braganca on 16/12/23.
//

import Foundation

protocol EmbassyViewModelProtocol: AnyObject {
    func successRequest()
    func errorRequest()
}

class EmbassyViewModel {
    
    private var embassy: EmbassyAbroad?
    private var service: EmbassyService = EmbassyService()
    weak var delegate: EmbassyViewModelProtocol?
    
    func fetchEmbassyAbroad(source: String) {
        service.getEmbassyAbroadURLSession(source: source) { result in
            switch result {
            case .success(let success):
                print(success)
                self.embassy = success
                self.delegate?.successRequest()
            case .failure(_):
                self.delegate?.errorRequest()
            }
        }
    }
    
    func numberOfRows() -> Int {
        return embassy?.data.count ?? 0
    }
    
    func getEmbassyList(indexPath: IndexPath) -> EmbassyAbroadDetail {
        return embassy?.data[indexPath.row] ?? EmbassyAbroadDetail(address: "", phone: "")
    }
    
}
