//
//  Service.swift
//  brasil
//
//  Created by Julio Braganca on 16/12/23.
//

import UIKit

class CountryService {
    

    
    func getEmbassyMock(completion: (Result<EmbassyAbroad, Error>) -> Void) {
        if let url = URL(string: "https://travel-info-api.p.rapidapi.com/find-embassy?source=usa&destination=brazil") {
            do {
                let data = try Data(contentsOf: url)
                let embassy: EmbassyAbroad = try JSONDecoder().decode(EmbassyAbroad.self, from: data)
                completion(.success(embassy))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    func getCountryActivitiesURLSession(completion: @escaping (Result<CountryActivities, Error>) -> Void) {
        guard let url = URL(string: "https://travel-info-api.p.rapidapi.com/country-activities?country=brazil") else { return }
        
        let headers = [
            "X-RapidAPI-Key": "05b4860263msh7862a91faa2cf04p172101jsna1a12ae8d7d0",
            "X-RapidAPI-Host": "travel-info-api.p.rapidapi.com"
        ]
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let dataResult = data else { return }
            
            guard let response = response as? HTTPURLResponse else { return }
            
            if response.statusCode == 200 {
                do {
                    let countryActivities: CountryActivities = try JSONDecoder().decode(CountryActivities.self, from: dataResult)
                    completion(.success(countryActivities))
                } catch {
                    completion(.failure(error))
                }
            } else {
                completion(.failure(error ?? NSError(domain: "Deu ruim em", code: response.statusCode)))
            }
        }
        task.resume()
    }
    
    func getCountryBriefURLSession(completion: @escaping (Result<CountryBrief, Error>) -> Void) {
        guard let url = URL(string: "https://travel-info-api.p.rapidapi.com/country?country=brazil") else { return }
        
        let headers = [
            "X-RapidAPI-Key": "05b4860263msh7862a91faa2cf04p172101jsna1a12ae8d7d0",
            "X-RapidAPI-Host": "travel-info-api.p.rapidapi.com"
        ]
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let dataResult = data else { return }
            
            guard let response = response as? HTTPURLResponse else { return }
            
            if response.statusCode == 200 {
                do {
                    let countryBrief: CountryBrief = try JSONDecoder().decode(CountryBrief.self, from: dataResult)
                    completion(.success(countryBrief))
                } catch {
                    completion(.failure(error))
                }
            } else {
                completion(.failure(error ?? NSError(domain: "Deu ruim em", code: response.statusCode)))
            }
        }
        task.resume()
    }
    
    

}

