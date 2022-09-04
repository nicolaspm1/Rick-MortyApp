//
//  APIManager.swift
//  Rick&Morty
//
//  Created by Pablo Manzur on 04/09/2022.
//

import Foundation
import Alamofire

final class APIManager {
    
    static let shared = APIManager()
    
    private init(){}
    
    func get(url: String, onCompletion: @escaping(Result<Data?, AFError>) -> Void) {
        
        AF.request(url).response { response in
            onCompletion(response.result)
        }
    }
}
