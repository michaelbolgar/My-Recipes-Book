//
//  SavedTableViewCell.swift
//  My-Recipes-Book
//
//  Created by admin on 29.08.2023.
//

import UIKit

final class SavedTableViewCell: UITableViewCell {
    
    static var reuseId: String {
        String(describing: Self.self)
    }
    
    private lazy var recipeImageView: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    // MARK: Score with Star image
    
    private lazy var recipeScoreView: UIView = {
        let scoreView = UIView()
        return scoreView
    }()
    
    private lazy var bookmarkView: UIView = {
        let bookmarkView = UIView()
        return bookmarkView
    }()
    
    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var recipeLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    // MARK: Author image with name label
    
    private lazy var authorView: UIView = {
        let view = UIView()
        return view
    }()
    
    private func confidureUI() {
        contentView.addSubview(recipeImageView)
        contentView.addSubview(recipeScoreView)
        contentView.addSubview(bookmarkView)
        contentView.addSubview(timeLabel)
        contentView.addSubview(recipeLabel)
        contentView.addSubview(authorView)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
