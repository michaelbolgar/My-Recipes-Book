//
//  PopularCategoryCollectionViewCell.swift
//  My-Recipes-Book
//
//  Created by Дмитрий Лоренц on 29.08.2023.
//

import UIKit
import SnapKit

class PopularCategoryCollectionViewCell: UICollectionViewCell {
    static let reuseID = "PopularCategoryCollectionViewCell"
    override var isSelected: Bool {
        didSet {
            label.textColor = isSelected ? .white : Palette.redPrimary20
            contentView.backgroundColor = isSelected ? Palette.redPrimary50 : .none
            
        }
    }
    private lazy var label: UILabel = {
        let label = UILabel()
        label.font = .poppins(weight: .bold, size: 12)
        label.textColor = isSelected ? .white : Palette.redPrimary20
        return label
    }()
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        print("Frame")
        setViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - Methods
    func setup(with title: String) {
        label.text = title
    }
    
    fileprivate func setViews() {
        print("Set outlets")
        contentView.layer.cornerRadius = 10
        contentView.clipsToBounds = true
        contentView.backgroundColor = isSelected ? Palette.redPrimary50 : .none
        contentView.addSubview(label)
    }
    
    fileprivate func setConstraints() {
        label.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(12)
            make.centerY.equalToSuperview()
        }
    }
}
