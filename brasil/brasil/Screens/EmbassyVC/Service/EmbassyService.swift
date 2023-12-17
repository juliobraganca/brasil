//
//  EmbassyService.swift
//  brasil
//
//  Created by Julio Braganca on 17/12/23.
//

import UIKit

class EmbassyService {
    func getEmbassyAbroadURLSession(completion: @escaping (Result<EmbassyAbroad, Error>) -> Void) {
        guard let url = URL(string: "https://travel-info-api.p.rapidapi.com/find-embassy?source=usa&destination=brazil") else { return }
        
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
                    let embassyAbroad: EmbassyAbroad = try JSONDecoder().decode(EmbassyAbroad.self, from: dataResult)
                    completion(.success(embassyAbroad))
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


