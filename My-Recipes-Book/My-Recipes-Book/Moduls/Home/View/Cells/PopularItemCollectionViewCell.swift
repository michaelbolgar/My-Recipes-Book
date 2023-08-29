//
//  PopularItemCollectionViewCell.swift
//  My-Recipes-Book
//
//  Created by Дмитрий Лоренц on 29.08.2023.
//

import UIKit

class PopularItemCollectionViewCell: UICollectionViewCell {
    static let reuseID = "PopularItemCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .blue
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
