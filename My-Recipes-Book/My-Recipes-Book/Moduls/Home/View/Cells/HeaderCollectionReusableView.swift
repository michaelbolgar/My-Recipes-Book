//
//  HeaderCollectionReusableView.swift
//  My-Recipes-Book
//
//  Created by Дмитрий Лоренц on 30.08.2023.
//

import UIKit
import SnapKit

class HeaderCollectionReusableView: UICollectionReusableView {
    
   //MARK: - Propperties
    static let reuseID = "HeaderCollectionReusableView"
    
    lazy var leftLabel: UILabel = {
        let label = UILabel()
        label.text = "Trending now 🔥"
        label.font = .poppins(weight: .bold, size: 20)
        return label
    }()
    
    lazy var rightLabel: UILabel = {
        let label = UILabel()
        label.text = "See all"
        label.font = .poppins(weight: .bold, size: 14)
        label.textColor = Palette.redPrimary50
        return label
    }()
    
    lazy var arrowImageView: UIImageView = {
        let view = UIImageView(image: UIImage(named: "Arrow-Right"))
        return view
    }()
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setOutlets()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - Methods
    fileprivate func setOutlets() {
        addSubview(leftLabel)
        addSubview(arrowImageView)
        addSubview(rightLabel)
    }
    
    fileprivate func setConstraints() {
        leftLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(16)
            make.centerY.equalToSuperview()
        }
        
        arrowImageView.snp.makeConstraints { make in
            make.width.height.equalTo(20)
            make.trailing.equalToSuperview().inset(16)
            make.centerY.equalTo(leftLabel)
        }
        
        rightLabel.snp.makeConstraints { make in
            make.trailing.equalTo(arrowImageView.snp.leading).inset(-3)
            make.centerY.equalTo(leftLabel)
        }
    }
    
}
