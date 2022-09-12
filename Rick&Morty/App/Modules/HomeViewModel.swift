//
//  HomeViewModel.swift
//  Rick&Morty
//
//  Created by Pablo Manzur on 12/09/2022.
//

import Foundation

protocol HomeDelegate: AnyObject {
    func loading()
    func stop()
    func reloadData()
    func show(error: String)
}


class HomeViewModel {
    
    private var characters = [Character]()
    private var episodes = [Episode]()
    private var locations = [Locations]()
    
    weak var delegate: HomeDelegate?
    var homeService: HomeDataRepositoryProtocol?
    
    init(homeService: HomeDataRepositoryProtocol = HomeDataService()) {
        self.homeService = homeService
    }
    
}

//MARK: - Get characters
extension HomeViewModel {
    
    func getCharacters() {
        homeService?.fetchCharacters(onComplete: { characters in
            self.characters = characters
            self.delegate?.loading()
            self.delegate?.reloadData()
        }, onError: { error in
            self.delegate?.show(error: error)
        })
    }
    
    func getCharactersCount() -> Int {
        characters.count
    }
    
    func getCharacterAt(index: Int) -> Character {
        characters[index]
    }
}

//MARK: - get episodes
extension HomeViewModel{
    
    func getEpisodes() {
        homeService?.fetchEpisodes(onComplete: { episodes in
            self.episodes = episodes
            self.delegate?.loading()
            self.delegate?.reloadData()
        }, onError: { error in
            self.delegate?.show(error: error)
        })
    }
    
    func getEpisodesCount() -> Int {
        episodes.count
    }
    
    func getEpisodeAt(index: Int) -> Episode {
        episodes[index]
    }
}



//MARK: - get locations
extension HomeViewModel {
    
    func getLocations() {
        homeService?.fetchLocations(onComplete: { locations in
            self.locations = locations
            self.delegate?.loading()
            self.delegate?.reloadData()
        }, onError: { error in
            self.delegate?.show(error: error)
        })
    }
    
    func getLocationsCount() -> Int {
        locations.count
    }
    
    func getLocationAt(index: Int) -> Locations {
        locations[index]
    }
}
