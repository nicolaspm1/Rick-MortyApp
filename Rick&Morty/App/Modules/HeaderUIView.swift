//
//  HeaderUIView.swift
//  Rick&Morty
//
//  Created by Pablo Manzur on 04/09/2022.
//

import UIKit

class HeaderUIView: UIView {
    
    private let imageHeaderView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "RickMortyHeader")
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageHeaderView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageHeaderView.frame = bounds
    }
}
