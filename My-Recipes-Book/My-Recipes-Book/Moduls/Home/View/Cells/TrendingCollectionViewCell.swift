//
//  TrendingCollectionViewCell.swift
//  My-Recipes-Book
//
//  Created by Дмитрий Лоренц on 29.08.2023.
//

import UIKit

class TrendingCollectionViewCell: UICollectionViewCell {
    static let reuseID = "TrendingCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .orange
        contentView.layer.borderColor = UIColor.black.cgColor
        contentView.layer.borderWidth = 1
        contentView.layer.cornerRadius = 10
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - Methods
    func setupCell(with recipe: Results?) {
        guard let recipe else {return}
//        dishImageView.imageFromURL(recipe.image ?? "", placeHolder: nil)
//        timeValueLabel.text = "\(recipe.cookingMinutes ?? 0)"
//        mainLabel.text = recipe.title
    }
}
