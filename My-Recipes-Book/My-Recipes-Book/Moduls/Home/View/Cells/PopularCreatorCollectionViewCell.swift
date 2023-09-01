//
//  PopularCollectionViewCell.swift
//  My-Recipes-Book
//
//  Created by Дмитрий Лоренц on 29.08.2023.
//

import UIKit

class PopularCreatorCollectionViewCell: UICollectionViewCell {
    static let reuseID = "PopularCollectionViewCell"
    
    private lazy var creatorImageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .yellow
        //view.layer.cornerRadius = creatorImageView.frame.height / 2
        return view
    }()
    
    private lazy var creatorNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Mahmud"
        label.textColor = Palette.neutral100
        label.textAlignment = .center
        label.font = .poppins(weight: .bold, size: 12)
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
        contentView.addSubview(creatorImageView)
        contentView.addSubview(creatorNameLabel)
    }
    
    private func setConstraints() {
        
        creatorImageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(creatorImageView.snp.width)
        }
        
        creatorNameLabel.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func setupCell() {
        
    }
}
