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
        scoreView.addSubview(scoreLabel)
        
        return scoreView
    }()
    
    // MARK: Bookmark Image
    
    private lazy var bookmarkImage: UIImageView = {
        let bookmarkImage = UIImageView()
        bookmarkImage.contentMode = .scaleAspectFit
        bookmarkImage.backgroundColor = .clear
        bookmarkImage.image = UIImage(named: "Bookmark")
        return bookmarkImage
    }()
    
    // MARK: Time label
    
    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.layer.cornerRadius = 16
        label.backgroundColor = UIColor(red: 0.19, green: 0.19, blue: 0.19, alpha: 0.3)
        label.layer.opacity = 0.3
        return label
    }()
    
    // MARK: Score with Star image
    
    private lazy var recipeNameView: UIView = {
        let view = UIView()
        let label = UILabel()
        let moreImageView = UIImageView()
        moreImageView.image = UIImage(named: "More")
        view.addSubview(label)
        return view
    }()
    
    // MARK: Author image with name label
    
    private lazy var authorView: UIView = {
        let view = UIView()
        return view
    }()
    
    // MARK: init base interface
    
    private func confidureUI() {
        contentView.addSubview(recipeImageView)
        contentView.addSubview(recipeScoreView)
        contentView.addSubview(bookmarkImage)
        contentView.addSubview(timeLabel)
        contentView.addSubview(recipeNameView)
        contentView.addSubview(authorView)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        recipeImageView.frame = CGRect(x: 16,
                                       y: contentView.safeAreaInsets.bottom,
                                       width: contentView.frame.width - 16 - 16,
                                       height: 215)
        recipeScoreView.frame = CGRect(x: recipeImageView.frame.minX + 8,
                                       y: recipeImageView.frame.origin.y + 8,
                                       width: 58,
                                       height: 27.6)
        bookmarkImage.frame = CGRect(x: recipeImageView.frame.maxX - 8 - 32,
                                     y: recipeImageView.frame.origin.y + 8,
                                     width: 32,
                                     height: 32)
        timeLabel.frame = CGRect(x: recipeImageView.frame.maxX - 8 - 41,
                                 y: recipeImageView.frame.maxY - 8,
                                 width: 41,
                                 height: 25)
        recipeNameView.frame = CGRect(x: <#T##CGFloat#>,
                                   y: <#T##CGFloat#>,
                                   width: <#T##CGFloat#>,
                                   height: <#T##CGFloat#>)
        authorView.frame = CGRect(x: <#T##CGFloat#>,
                                  y: <#T##CGFloat#>,
                                  width: <#T##CGFloat#>,
                                  height: <#T##CGFloat#>)
    }
    
}
