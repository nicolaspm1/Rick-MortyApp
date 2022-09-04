//
//  Constants.swift
//  Rick&Morty
//
//  Created by Pablo Manzur on 04/09/2022.
//

import Foundation

struct Constants {
    static let BASE_URL = Bundle.main.object(forInfoDictionaryKey: "BASE_URL") as! String
}

struct KUrl {
    static let characters = "\(Constants.BASE_URL)character"
    static let episodes = "\(Constants.BASE_URL)episode"
    static let locations = "\(Constants.BASE_URL)location"
}
