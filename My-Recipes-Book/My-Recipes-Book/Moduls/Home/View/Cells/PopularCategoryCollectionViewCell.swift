//
//  PopularCategoryCollectionViewCell.swift
//  My-Recipes-Book
//
//  Created by Дмитрий Лоренц on 29.08.2023.
//

import UIKit

class PopularCategoryCollectionViewCell: UICollectionViewCell {
    static let id = "PopularCategoryCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .black
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
