//
//  TrendRecipeCell.swift
//  My-Recipes-Book
//
//  Created by Nickolay Vasilchenko on 28.08.2023.
//

import Foundation
import UIKit
import SnapKit

class TrandRecipeCell: UITableViewCell {
    
    static let cellID = "TrandRecipeCell"
    
    private var dishImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.imageFromURL("https://via.placeholder.com/600/d32776", placeHolder: nil)
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        return imageView
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
    
    private var recipeNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .white
        label.contentMode = .left
        label.text = "ghujiudf ufdufwef i wsefiu ief \nghbfhrfyjdcv"
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    private var countOfIngredientsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "9 Ingredients"
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    private var cookTimeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "25 min"
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    private var lineSeparatorLabel: UILabel = {
        let label = UILabel()
        label.text = "|"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
        putToHierarchy()
        setLayouts()
        setPointScoreLabel(score: "5,0")
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func setupCell() {
    }
    
    private func putToHierarchy() {
        self.addSubview(dishImageView)
        dishImageView.addSubview(recipeNameLabel)
        dishImageView.addSubview(countOfIngredientsLabel)
        dishImageView.addSubview(lineSeparatorLabel)
        dishImageView.addSubview(cookTimeLabel)
        dishImageView.addSubview(pointScoreView)
    }
    
    private func setLayouts() {
        dishImageView.snp.makeConstraints { make in
            make.edges.equalTo(self).inset(UIEdgeInsets(top: 12, left: 15, bottom: 24, right: 15))
        }
        pointScoreView.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 58, height: 27))
            make.top.equalToSuperview().offset(8)
            make.left.equalToSuperview().offset(8)
        }
        recipeNameLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(15)
            make.bottom.equalTo(countOfIngredientsLabel).offset(-26)
        }
        countOfIngredientsLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(15)
            make.bottom.equalToSuperview().offset(-16)
            make.size.equalTo(CGSize(width: 80, height: 18))
        }
        lineSeparatorLabel.snp.makeConstraints { make in
            make.left.equalTo(countOfIngredientsLabel).offset(85)
            make.bottom.equalTo(countOfIngredientsLabel)
            make.size.equalTo(CGSize(width: 2, height: 18))
        }
        cookTimeLabel.snp.makeConstraints { make in
            make.left.equalTo(lineSeparatorLabel).offset(8)
            make.bottom.equalTo(countOfIngredientsLabel)
            make.size.equalTo(CGSize(width: 100, height: 18))
        }
    }
    
    private func setPointScoreLabel(score: String) {
        let scoreLabel = UILabel(frame: CGRect(x: 27, y: 4, width: 24, height: 20))
        scoreLabel.text = score
        scoreLabel.textColor = .white
        pointScoreView.addSubview(scoreLabel)
    }
}
