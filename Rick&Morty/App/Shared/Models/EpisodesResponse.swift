//
//  EpisodesResponse.swift
//  Rick&Morty
//
//  Created by Pablo Manzur on 04/09/2022.
//

import Foundation

// MARK: - EpisodesResponse
struct EpisodesResponse: Codable {
    let info: EpisodeInfo
    let results: [Episode]
}

// MARK: - EpisodeInfo
struct EpisodeInfo: Codable {
    let count, pages: Int
    let next: String
}

// MARK: - Result
struct Episode: Codable {
    let id: Int
    let name, episode: String
    let airDate: String?
    let characters: [String]
    let url: String
    let created: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case airDate = "air_date"
        case episode, characters, url, created
    }
}
