//
//  HomeViewModel.swift
//  Rick&Morty
//
//  Created by Pablo Manzur on 12/09/2022.
//

//MARK: - TODO Refactor view Model

import Foundation

protocol HomeDelegate: AnyObject {
    func loading()
    func stop()
    func reloadData()
    func show(error: String)
}


class HomeViewModel {
    
    
    weak var delegate: HomeDelegate?
    var homeService: HomeDataRepositoryProtocol?
    
    init(homeService: HomeDataRepositoryProtocol = HomeDataService()) {
        self.homeService = homeService
    }
    
}

//MARK: - Get characters
extension HomeViewModel {
    
    func setArrayFor(section: Int, in cell: CollectionViewTableViewCell) {
        
        switch section{
            case Sections.apiCharacters.rawValue:
                
                homeService?.fetchCharacters { characters in
                    cell.configure(with: characters)
                } onError: { error in
                    print(error)
                }

            case Sections.apiEpisodes.rawValue:
                
                homeService?.fetchEpisodes { episodes in
                    cell.configure(with: episodes)
                } onError: { error in
                    print(error)
                }

            case Sections.apiLocations.rawValue :
                homeService?.fetchLocations { locations in
                    cell.configure(with: locations)
                } onError: { error in
                    print(error)
                }
                
            default:
                return
        }
    }
    
}

