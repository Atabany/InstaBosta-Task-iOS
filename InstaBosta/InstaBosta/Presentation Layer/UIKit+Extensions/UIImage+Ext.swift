//
//  UIImage+Ext.swift
//  InstaBosta
//
//  Created by Mohamed Elatabany on 04/06/2022.
//


import UIKit

extension UIImageView {
    func setImage(from urlString: String) {
        Task { image =  await BaseAPI().downloadImage(from: urlString) ?? UIImage() }
    }
}

