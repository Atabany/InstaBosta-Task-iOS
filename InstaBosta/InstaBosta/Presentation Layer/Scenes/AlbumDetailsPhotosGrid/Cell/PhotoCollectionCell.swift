//
//  PhotoCollectionCell.swift
//  InstaBosta
//
//  Created by Mohamed Elatabany on 04/06/2022.
//

import UIKit

class PhotoCollectionCell: UICollectionViewCell {
    
    static let reuseId = "PhotoCollectionCell"
    let photoImageView  =  UIImageView.init(image:  UIImage(named: K.Images.placeholder) ?? UIImage())

    

    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        photoImageView.image = UIImage(named: K.Images.placeholder) ?? UIImage()
        photoImageView.backgroundColor = UIColor.darkGray
    }
    
    private func configure() {
        addSubview(photoImageView)
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: topAnchor),
            photoImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            photoImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            photoImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    
    
}
