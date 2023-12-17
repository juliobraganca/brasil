//
//  EmbassyAbroad.swift
//  brasil
//
//  Created by Julio Braganca on 16/12/23.
//

import Foundation

// MARK: - ListCountry
struct EmbassyAbroad: Codable {
    var data: [EmbassyAbroadDetail]
}

// MARK: - Datum
struct EmbassyAbroadDetail: Codable {
    var address: String
    var phone: String
}

