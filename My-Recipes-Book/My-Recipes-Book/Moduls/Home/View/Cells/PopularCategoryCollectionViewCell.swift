//
//  PopularCategoryCollectionViewCell.swift
//  My-Recipes-Book
//
//  Created by Дмитрий Лоренц on 29.08.2023.
//

import UIKit

class PopularCategoryCollectionViewCell: UICollectionViewCell {
    static let reuseID = "PopularCategoryCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .blue
        contentView.layer.borderColor = UIColor.black.cgColor
        contentView.layer.borderWidth = 1
        contentView.layer.cornerRadius = 10
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
