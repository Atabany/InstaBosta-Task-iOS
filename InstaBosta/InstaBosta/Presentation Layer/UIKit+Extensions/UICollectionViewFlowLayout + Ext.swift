//
//  UICollectionViewFlowLayout + Ext.swift
//  InstaBosta
//
//  Created by Mohamed Elatabany on 04/06/2022.
//

import UIKit

extension UICollectionViewFlowLayout {
    func configureColoumnsFlowLayout(in view: UIView, with numberOfColumns: CGFloat, padding: CGFloat = 0)  {
        let width = view.bounds.width
        let padding: CGFloat = padding
        let minWidthSpacing: CGFloat = 0
        let availableWidth = width - (padding * 2)  - ( minWidthSpacing * (numberOfColumns - 1))
        let itemWidth = availableWidth / numberOfColumns
        sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        itemSize = CGSize(width: itemWidth, height: itemWidth)
    }
}
