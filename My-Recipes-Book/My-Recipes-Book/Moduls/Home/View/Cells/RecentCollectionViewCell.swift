//
//  RecentCollectionViewCell.swift
//  My-Recipes-Book
//
//  Created by Дмитрий Лоренц on 29.08.2023.
//

import UIKit

class RecentCollectionViewCell: UICollectionViewCell {
    static let reuseID = "RecentCollectionViewCell"
    
    private lazy var dishImageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .gray
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFill
        view.layer.cornerRadius = 10
        return view
    }()
    
    private lazy var creatorNameLabel: UILabel = {
        let label = UILabel()
        label.text = "By Zeelicious Foods"
        label.textColor = Palette.neutral30
        label.font = .poppins(weight: .regular, size: 12)
        return label
    }()
    
    private lazy var mainLabel: UILabel = {
        let label = UILabel()
        label.text = "Kelewele Ghanian Recipe"
        label.numberOfLines = 2
        //label.adjustsFontSizeToFitWidth = true
        label.textColor = Palette.neutral100
        label.font = .poppins(weight: .bold, size: 14)
        return label
    }()
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    
    private func setViews() {
        contentView.addSubview(dishImageView)
        contentView.addSubview(creatorNameLabel)
        contentView.addSubview(mainLabel)
    }
    
    private func setConstraints() {
        
        dishImageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(dishImageView.snp.width)
        }
        
        mainLabel.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview()
            make.top.equalTo(dishImageView.snp.bottom).inset(-8)
        }
        
        creatorNameLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(3)
            make.bottom.equalToSuperview()
        }
    }
    
    func setupCell(with recipe: Results?) {
        dishImageView.imageFromURL(recipe?.image ?? "", placeHolder: nil)
        mainLabel.text = recipe?.title
        creatorNameLabel.text = "By " + (recipe?.sourceName?.capitalized ?? "No data")
    }
}
