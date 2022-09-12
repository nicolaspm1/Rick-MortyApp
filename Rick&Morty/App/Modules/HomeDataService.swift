//
//  HomeDataService.swift
//  Rick&Morty
//
//  Created by Pablo Manzur on 04/09/2022.
//

import Foundation

protocol HomeDataRepositoryProtocol {
    
    func fetchCharacters(onComplete: @escaping ([Character]) -> Void, onError: @escaping (String) -> Void)
    func fetchEpisodes(onComplete: @escaping ([Episode]) -> Void,  onError: @escaping (String) -> Void)
    func fetchLocations(onComplete: @escaping ([Locations]) -> Void, onError: @escaping (String) -> Void)
    
}

class HomeDataService: HomeDataRepositoryProtocol {
    
    private let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        return decoder
    }()
    
    func fetchCharacters(onComplete: @escaping ([Character]) -> Void, onError: @escaping (String) -> Void) {
        
        APIManager.shared.get(url: KUrl.characters) { response in
            switch response {
                    
                case .success(let data):
                    do {
                        if let data = data {
                            self.decoder.keyDecodingStrategy = .convertFromSnakeCase
                            let characterResponse = try self.decoder.decode(CharactersResponse.self, from: data)
                            onComplete(characterResponse.results)
                        }
                        
                    } catch {
                        onError(error.localizedDescription)
                    }
                case .failure(let fail):
                    onError(fail.localizedDescription)
            }
        }
    }
    
    func fetchEpisodes(onComplete: @escaping ([Episode]) -> Void, onError: @escaping (String) -> Void) {
        
        APIManager.shared.get(url: KUrl.episodes) { response in
            switch response {
                    
                case .success(let data):
                    do {
                        if let data = data {
                            self.decoder.keyDecodingStrategy = .convertFromSnakeCase
                            let episodeResponse = try self.decoder.decode(EpisodesResponse.self, from: data)
                            onComplete(episodeResponse.results)
                        }
                        
                    } catch {
                        onError(error.localizedDescription)
                    }
                case .failure(let fail):
                    onError(fail.localizedDescription)
            }
        }
    }
    
    func fetchLocations(onComplete: @escaping ([Locations]) -> Void, onError: @escaping (String) -> Void) {
        
        APIManager.shared.get(url: KUrl.locations) { response in
            switch response {
                    
                case .success(let data):
                    do {
                        if let data = data {
                            self.decoder.keyDecodingStrategy = .convertFromSnakeCase
                            let locationsResponse = try self.decoder.decode(LocationsResponse.self, from: data)
                            onComplete(locationsResponse.results)
                        }
                        
                    } catch {
                        onError(error.localizedDescription)
                    }
                case .failure(let fail):
                    onError(fail.localizedDescription)
            }
        }
    }
    
    
}
