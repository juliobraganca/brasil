//
//  CountryBrief.swift
//  brasil
//
//  Created by Julio Braganca on 16/12/23.
//

import Foundation

// MARK: - CountryBrief
struct CountryBrief: Codable {
    var data: CountryBriefData?
}

// MARK: - CountryBriefData
struct CountryBriefData: Codable {
    var info: String?
    var imageURL: String?
    var countryImages: [CountryImage]?

    enum CodingKeys: String, CodingKey {
        case info
        case imageURL = "image_url"
        case countryImages = "country_images"
    }
}

// MARK: - CountryImage
struct CountryImage: Codable {
    var imageURL: String?
    var title: String?

    enum CodingKeys: String, CodingKey {
        case imageURL = "imageUrl"
        case title
    }
}
