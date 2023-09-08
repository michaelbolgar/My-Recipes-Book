//
//  TrendingCollectionViewCell.swift
//  My-Recipes-Book
//
//  Created by Дмитрий Лоренц on 29.08.2023.
//

import UIKit

class TrendingCollectionViewCell: UICollectionViewCell {
    static let reuseID = "TrendingCollectionViewCell"
    
    private lazy var dishImageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .gray
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        return view
    }()
    
    private lazy var mainLabel: UILabel = {
        let label = UILabel()
        label.text = "Kelewele Ghanian Recipe"
        label.textColor = Palette.neutral100
        label.font = .poppins(weight: .bold, size: 16)
        return label
    }()
    
    private lazy var creatorImageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .gray
        view.image = DataBase.shared.creatorImagesArray.randomElement() as? UIImage
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var creatorNameLabel: UILabel = {
        let label = UILabel()
        label.text = "By Zeelicious Foods"
        label.textAlignment = .left
        label.textColor = Palette.neutral50
        label.font = .poppins(weight: .regular, size: 12)
        return label
    }()
    
    private lazy var whiteBokkmarkView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var bookmarkImageView: UIImageView = {
        let view = UIImageView()
        //view.backgroundColor = .blue
        view.clipsToBounds = true
        //view.contentMode = .scaleAspectFill
        view.image = UIImage(named: "bookmarkInactive")
        return view
    }()
    
    private let pointScoreView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        view.layer.cornerRadius = 8
        var starImage = UIImageView(frame: CGRect(x: 8, y: 5, width: 16, height: 16))
        starImage.image = UIImage(named: "Star")
        starImage.contentMode = .scaleAspectFill
        view.addSubview(starImage)
        return view
    }()
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
        setConstraints()
        setPointScoreLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    
    private func setViews() {
        contentView.addSubview(dishImageView)
        contentView.addSubview(mainLabel)
        contentView.addSubview(creatorImageView)
        contentView.addSubview(creatorNameLabel)
        contentView.addSubview(whiteBokkmarkView)
        whiteBokkmarkView.addSubview(bookmarkImageView)
        contentView.addSubview(pointScoreView)
    }
    
    private func setConstraints() {
        
        dishImageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(dishImageView.snp.width).multipliedBy(180.0 / 280.0)
        }
        
        creatorImageView.snp.makeConstraints { make in
            make.width.height.equalTo(32)
            make.leading.bottom.equalToSuperview()
        }
        
        creatorNameLabel.snp.makeConstraints { make in
            make.leading.equalTo(creatorImageView.snp.trailing).inset(-8)
            make.centerY.equalTo(creatorImageView)
        }
        
        mainLabel.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview()
            make.bottom.equalTo(creatorImageView.snp.top).inset(-8)
        }
        
        whiteBokkmarkView.snp.makeConstraints { make in
            make.width.height.equalTo(creatorImageView)
            make.top.trailing.equalToSuperview().inset(8)
        }
        
        bookmarkImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(5)
        }
        
        pointScoreView.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().inset(8)
            make.size.equalTo(CGSize(width: 58, height: 27))
        }
        
    }
    
    private func setPointScoreLabel() {
        let scoreLabel = UILabel(frame: CGRect(x: 27, y: 4, width: 26, height: 20))
        let randomScore = Double.random(in: 0.0 ... 5.0)
        scoreLabel.text = String(format: "%.1f", randomScore)
        scoreLabel.textColor = .white
        pointScoreView.addSubview(scoreLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        creatorImageView.layer.cornerRadius = creatorImageView.frame.height / 2
        whiteBokkmarkView.layer.cornerRadius = whiteBokkmarkView.frame.height / 2
    }
    
    func setupCell(with recipe: Results?) {
        dishImageView.imageFromURL(recipe?.image ?? "", placeHolder: nil)
        mainLabel.text = recipe?.title
        creatorNameLabel.text = "By " + (recipe?.sourceName?.capitalized ?? "No data")
    }
}
