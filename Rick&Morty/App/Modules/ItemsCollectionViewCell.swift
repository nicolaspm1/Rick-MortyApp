//
//  ItemsCollectionViewCell.swift
//  Rick&Morty
//
//  Created by Pablo Manzur on 12/09/2022.
//

import UIKit
import Kingfisher

class ItemsCollectionViewCell: UICollectionViewCell {
    
    static  let identifier = "ItemsCollectionViewCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let name: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = 0
        label.lineBreakMode = .byClipping
        label.text = ""
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .clear
        contentView.addSubview(imageView)
        contentView.addSubview(name)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, right: contentView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, height: 140)
        
        name.anchor(top: imageView.bottomAnchor, left: contentView.leftAnchor, right: contentView.rightAnchor, paddingTop: 20, paddingLeft: 5, paddingBottom: 0, paddingRight: 5)
    }
    
    
    func configure(with item: Any) {
        
        let defaultLocationsImages = "DefaultLocation"
        let defaultEpisodesImages = "RickMortyEpisodes"
        
        if  let character = item as? Character {
            
            let url = URL(string: character.image)
            imageView.kf.setImage(with: url)
            name.text = character.name
            
        }
        else if let episode = item as? Episode {
            imageView.image = UIImage(named: defaultEpisodesImages)
            name.text = episode.name
        }
        else if let location = item as? Locations {
            imageView.image = UIImage(named: defaultLocationsImages)
            name.text = location.name
        }
    }
}
