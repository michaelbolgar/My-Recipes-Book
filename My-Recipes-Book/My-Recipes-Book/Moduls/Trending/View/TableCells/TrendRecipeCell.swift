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
// MARK: - Properties
    static let cellID = "TrandRecipeCell"

    private var dishImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        return imageView
    }()
// MARK: - UI element
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
        label.font = UIFont(name: "Poppins-Bold", size: 16)
        return label
    }()

    private var countOfIngredientsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "Poppins-Bold", size: 12)
        return label
    }()

    private var cookTimeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "Poppins-Bold", size: 12)
        return label
    }()

    private var lineSeparatorLabel: UILabel = {
        let label = UILabel()
        label.text = "|"
        label.textColor = .white
        label.font = UIFont(name: "Poppins-Bold", size: 18)
        return label
    }()

    private var creatorNameLabel: UILabel = {
        let label = UILabel()
        label.text = "George Filladelfia"
        label.textColor = .white
        label.font = UIFont(name: "Poppins-Bold", size: 12)
        return label
    }()
// MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
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
//MARK: - Public interface
    public func transnferData(recipe data: Results?, section type: SectionType, row number: Int) {
        switch type {
        case .trending:
            adaptCellForTrendingNow(recipeData: data)
        case .recentRecipe:
            adaptCellForRecentRecipe(recipeData: data)
        case .popularCreator:
            adaptCellForPopularCreators(recipeData: data, rowNumber: number)
        default:
            print("No options for this case")
        }
    }
// MARK: - Cell preparation
    private func putToHierarchy() {
        self.addSubview(dishImageView)
        dishImageView.addSubview(recipeNameLabel)
        dishImageView.addSubview(countOfIngredientsLabel)
        dishImageView.addSubview(lineSeparatorLabel)
        dishImageView.addSubview(cookTimeLabel)
        dishImageView.addSubview(pointScoreView)
        dishImageView.addSubview(creatorNameLabel)
    }
    //This scoreLabel will have a value only after the cell is loaded.
    //It cannot be declared in the context of pointScoreView,
    //so it is described in a separate function
    private func setPointScoreLabel(score: String) {
        let scoreLabel = UILabel(frame: CGRect(x: 27, y: 4, width: 24, height: 20))
        scoreLabel.text = score
        scoreLabel.textColor = .white
        pointScoreView.addSubview(scoreLabel)
    }
    //Changes the appearance of the cell for Trending now section type
    private func adaptCellForTrendingNow(recipeData: Results?) {
        guard let recipeData = recipeData else { return }
        dishImageView.imageFromURL(recipeData.image ?? "", placeHolder: nil)
        recipeNameLabel.text = recipeData.title ?? "no title"
        countOfIngredientsLabel.text = "\(recipeData.extendedIngredients?.count ?? 0) Ingredients"
        cookTimeLabel.text = "\(recipeData.cookingMinutes ?? 0) min"
        creatorNameLabel.isHidden = true
    }
    //Changes the appearance of the cell for Recent recipe section type
    private func adaptCellForRecentRecipe(recipeData: Results?) {
        guard let recipeData = recipeData else { return }
        dishImageView.imageFromURL(recipeData.image ?? "", placeHolder: nil)
        recipeNameLabel.text = recipeData.title ?? "no title"
        countOfIngredientsLabel.isHidden = true
        cookTimeLabel.isHidden = true
        creatorNameLabel.isHidden = true
        lineSeparatorLabel.isHidden = true
    }
    //Changes the appearance of the cell for Popular creators section type
    private func adaptCellForPopularCreators(recipeData: Results?, rowNumber: Int) {
        guard let recipeData = recipeData else { return }
        dishImageView.image = DataBase.shared.creatorImagesArray[rowNumber]
        //recipeNameLabel used to display the creator's name.
        //Otherwise, you would have to change the label configuration and change its location.
        //It's easier this way
        recipeNameLabel.text = recipeData.creditsText ?? "no title"
        countOfIngredientsLabel.isHidden = true
        cookTimeLabel.isHidden = true
        creatorNameLabel.isHidden = true
        lineSeparatorLabel.isHidden = true
        pointScoreView.isHidden = true
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
            make.size.equalTo(CGSize(width: 95, height: 18))
        }
        lineSeparatorLabel.snp.makeConstraints { make in
            make.left.equalTo(countOfIngredientsLabel).offset(97)
            make.bottom.equalTo(countOfIngredientsLabel)
            make.size.equalTo(CGSize(width: 2, height: 18))
        }
        cookTimeLabel.snp.makeConstraints { make in
            make.left.equalTo(lineSeparatorLabel).offset(8)
            make.bottom.equalTo(countOfIngredientsLabel)
            make.size.equalTo(CGSize(width: 100, height: 18))
        }
        creatorNameLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(15)
            make.bottom.equalToSuperview().offset(-16)
            make.size.equalTo(CGSize(width: 150, height: 18))
        }

    }
}
