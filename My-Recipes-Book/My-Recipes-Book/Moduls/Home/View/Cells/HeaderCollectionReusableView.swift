//
//  HeaderCollectionReusableView.swift
//  My-Recipes-Book
//
//  Created by Дмитрий Лоренц on 30.08.2023.
//

import UIKit
import SnapKit

class HeaderCollectionReusableView: UICollectionReusableView {
   static let reuseID = "HeaderCollectionReusableView"
    let label = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        label.text = "Trending now 🔥"
        addSubview(label)
        label.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(16)
            make.centerY.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
