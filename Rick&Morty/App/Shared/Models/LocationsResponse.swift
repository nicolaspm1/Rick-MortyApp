//
//  LocationsResponse.swift
//  Rick&Morty
//
//  Created by Pablo Manzur on 04/09/2022.
//

import Foundation

// MARK: - LocationsResponse
struct LocationsResponse: Codable {
    let info: LocationInfo
    let results: [Locations]
}

// MARK: - LocationInfo
struct LocationInfo: Codable {
    let count, pages: Int
    let next: String
}

// MARK: - Result
struct Locations: Codable {
    let id: Int
    let name, type, dimension: String
    let residents: [String]
    let url: String
    let created: String
}
