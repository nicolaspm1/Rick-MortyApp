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
        return imageView
    }()
    
    private let name: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.text = ""
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        contentView.addSubview(name)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, right: contentView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, height: 140)
        
        name.anchor(top: imageView.bottomAnchor, left: contentView.leftAnchor, right: contentView.rightAnchor, paddingTop: 20, paddingLeft: 30, paddingBottom: 0, paddingRight: 20)
    }
    
    
    func configure(with item: Any) {
        
        let imageName = "Rick&MortyTitle"
        
        if  let character = item as? Character {
            
            let url = URL(string: character.image)
            imageView.kf.setImage(with: url)
            name.text = character.name
            
        }
        else if let episode = item as? Episode {
            imageView.image = UIImage(named: imageName)
            name.text = episode.name
        }
        else if let location = item as? Locations {
            imageView.image = UIImage(named: imageName)
            name.text = location.name
        }
    }
}
