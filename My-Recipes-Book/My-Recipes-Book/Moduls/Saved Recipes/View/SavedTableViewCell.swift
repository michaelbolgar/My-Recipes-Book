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
        image.image = UIImage()
        image.backgroundColor = .orange
        image.layer.cornerRadius = 16
        return image
    }()
    
    // MARK: Score with Star image
    
    private lazy var recipeScoreView: UIView = {
        let scoreView = UIView()
        scoreView.frame = CGRect(x: 8, y: 8, width: 58, height: 27.6)
        scoreView.layer.cornerRadius = 16
        scoreView.backgroundColor = UIColor(red: 0.19, green: 0.19, blue: 0.19, alpha: 0.3)
        scoreView.layer.opacity = 0.3
        
        let starView = UIImageView()
        starView.frame = CGRect(x: 8, y: 5.8, width: 16, height: 16)
        starView.contentMode = .scaleAspectFit
        starView.image = UIImage(systemName: "star.fill")
        scoreView.addSubview(starView)
        
        let scoreLabel = UILabel()
        scoreLabel.frame = CGRect(x: starView.frame.maxX + 3, y: 4, width: 24, height: 20)
        scoreLabel.font = UIFont.boldSystemFont(ofSize: 14)
        scoreLabel.text = "5.0"
        scoreView.addSubview(scoreLabel)
        
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
