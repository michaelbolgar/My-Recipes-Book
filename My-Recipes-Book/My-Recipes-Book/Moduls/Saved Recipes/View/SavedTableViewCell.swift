//
//  SavedTableViewCell.swift
//  My-Recipes-Book
//
//  Created by admin on 08.09.2023.
//

import UIKit
import SnapKit

final class SavedTableViewCell: UITableViewCell {
    static var reuseId: String {
        String(describing: Self.self)
    }
    
    private lazy var recipeImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.backgroundColor = .orange
        image.layer.cornerRadius = 16
        return image
    }()
    
    // MARK: Score with Star image
    
    private lazy var recipeScoreView: UIView = {
        
        let scoreView = UIView()
        scoreView.layer.cornerRadius = 10
        scoreView.clipsToBounds = true
        
        // blur background effect
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = scoreView.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurEffectView.layer.cornerRadius = 10
        blurEffectView.layer.opacity = 0.7
        scoreView.addSubview(blurEffectView)
        
        return scoreView
    }()
    
    private lazy var scoreStarImage: UIImageView = {
        // star view
        let starView = UIImageView()
        starView.tintColor = .black
        starView.contentMode = .scaleAspectFill
        starView.image = UIImage(systemName: "star.fill")
        recipeScoreView.addSubview(starView)
        return starView
    }()
    
    private lazy var recipeScoreLabel: UILabel = {
        let scoreLabel = UILabel()
        scoreLabel.numberOfLines = 0
        scoreLabel.font = UIFont.boldSystemFont(ofSize: 14)
        recipeScoreView.addSubview(scoreLabel)
        return scoreLabel
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
        label.frame = CGRect(x: 0, y: 0, width: view.frame.width - 20 - 16, height: 22)
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    
        let moreImageView = UIImageView()
        moreImageView.frame = CGRect(x: label.frame.maxX + 16, y: 0, width: 20, height: 20)
        moreImageView.image = UIImage(named: "More")
        moreImageView.contentMode = .scaleAspectFit
        
        view.addSubview(label)
        view.addSubview(moreImageView)
        return view
    }()
    
    // MARK: Author image with name label
    
    private var authorImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "AuthorImage")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private var authorLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor(red: 0.57, green: 0.57, blue: 0.57, alpha: 1)
        return label
    }()
    
    // MARK: init base interface
    
    private func configureUI() {
        contentView.addSubview(recipeImageView)
        contentView.addSubview(recipeScoreView)
        contentView.addSubview(bookmarkImage)
        contentView.addSubview(timeLabel)
        contentView.addSubview(recipeNameView)
        contentView.addSubview(authorImageView)
        contentView.addSubview(authorLabel)
    }
    
    func configureCell(with model: Model) {
        // set recipeImage to UIImageView
        recipeImageView.image = UIImage(named: model.recipeImage)
        
        // Add score label to RecipeScoreView
        recipeScoreLabel.text = model.score
        
        // set time label text from current recipe
        timeLabel.text = model.time
        
        // set author image to currentAuthor
        authorImageView.image = UIImage(named: model.authorImage)
        
        // set author name to label
        authorLabel.text = model.authorLabel
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        configureUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraints() {
        recipeImageView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalToSuperview().inset(12)
            make.bottom.equalToSuperview().inset(60)
            make.height.equalTo(recipeImageView.snp.width).multipliedBy(215.0 / 343.0)
        }
        
        recipeScoreView.snp.makeConstraints { make in
            make.leading.equalTo(recipeImageView).inset(8)
            make.top.equalToSuperview().inset(25)
            make.trailing.equalToSuperview().inset(277)
            make.height.equalTo(recipeScoreView.snp.width).multipliedBy(27.6 / 58)
        }
        
        recipeScoreLabel.snp.makeConstraints { make in
            make.leading.equalTo(recipeScoreView.snp.leading).inset(27)
            make.top.equalTo(recipeScoreView.snp.top).inset(4)
            make.trailing.equalTo(recipeScoreView.snp.trailing).inset(7)
            make.bottom.equalTo(recipeScoreView.snp.bottom).inset(3.6)
//            make.height.equalTo(recipeScoreLabel.snp.width).multipliedBy(20.0 / 24.0)
        }
        /*  27
            4
            7
            3.6
         */
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
}
