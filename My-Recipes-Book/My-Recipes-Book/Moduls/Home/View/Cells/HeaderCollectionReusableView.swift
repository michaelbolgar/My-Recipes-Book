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
    var tapGestureRecognizer: UITapGestureRecognizer!//(target: HeaderCollectionReusableView.self, action: #selector(seeAllButtonTapped))
    
    private lazy var leftLabel: UILabel = {
        let label = UILabel()
        label.font = .poppins(weight: .semibold, size: 20)
        return label
    }()
    
    private lazy var rightLabel: UILabel = {
        let label = UILabel()
        label.text = "See all"
        label.isUserInteractionEnabled = true
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(seeAllButtonTapped))
        label.addGestureRecognizer(tapGestureRecognizer)
        label.font = .poppins(weight: .bold, size: 14)
        label.textColor = Palette.redPrimary50
        return label
    }()
    
    private lazy var arrowImageView: UIImageView = {
        let view = UIImageView(image: UIImage(named: "Arrow-Right"))
        view.isUserInteractionEnabled = true
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(seeAllButtonTapped))
        view.addGestureRecognizer(tapGestureRecognizer)
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
    
    @objc func seeAllButtonTapped() {
        print("See all pressed")
    }
    
    func setup(_ data: (title: String, isHidden: Bool)) {
        leftLabel.text = data.title
        rightLabel.isHidden = data.isHidden
        arrowImageView.isHidden = data.isHidden
    }
    
}
