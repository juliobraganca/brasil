//
//  CountryActivities.swift
//  brasil
//
//  Created by Julio Braganca on 16/12/23.
//

import Foundation

// MARK: - ListCountry
struct CountryActivities: Codable {
    var data: ActivityData?
}

// MARK: - DataClass
struct ActivityData: Codable {
    var activities: [Activity]?
}

// MARK: - Activity
struct Activity: Codable {
    var title, activity: String?
}
