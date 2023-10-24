//
//  MyRecipeCell.swift
//  My-Recipes-Book
//
//  Created by Kirill Taraturin on 18.10.2023.
//

import UIKit

class MyRecipeCell: UITableViewCell {
    
    // MARK: - Static Properties
    static let cellID = String(describing: MyRecipeCell.self)
    
    // MARK: - Private UI properties
    private var dishImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let pointScoreView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.19, green: 0.19, blue: 0.19, alpha: 1.00).withAlphaComponent(0.3)
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
        label.font = UIFont.poppins(weight: .bold, size: 16)
        return label
    }()
    
    private var countOfIngredientsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.poppins(weight: .regular, size: 12)
        return label
    }()
    
    private var cookTimeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.poppins(weight: .regular, size: 12)
        return label
    }()
    
    private var lineSeparatorLabel: UILabel = {
        let label = UILabel()
        label.text = "|"
        label.textColor = .white
        label.font = UIFont(name: "Poppins-Bold", size: 18)
        return label
    }()
    
    // MARK: - Default UI Properties
    private lazy var defaultView: UIView = {
        var view = UIView()
        view.backgroundColor = .systemGray4
        view.layer.cornerRadius = 10
        view.isHidden = true
        return view
    }()
    
    private lazy var defaultLabel: UILabel = {
        var label = UILabel()
        label.text = "No recipes have been added yet"
        label.textColor = .white
        label.font = UIFont.poppins(weight: .bold, size: 20)
        label.isHidden = true
        return label
    }()
    
    private lazy var defaultButton: UIButton = {
        var button = UIButton(type: .system)
        button.backgroundColor = Palette.redPrimary50
        button.setTitle("Add your first recipe", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.poppins(weight: .regular, size: 18)
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(defaultButtonDidTapped), for: .touchUpInside)
        button.isHidden = true
        return button
    }()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        putToHierarchy()
        setLayouts()
        setPointScoreLabel(score: "5,0")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    func configure(with image: Data?, recipeName: String, ingrCount: Int, cookTime: String) {
        defaultView.isHidden = true
        defaultLabel.isHidden = true
        defaultButton.isHidden = true
        dishImageView.isHidden = false
        
        let defaultImage = UIImage(named: "defaultImageCell")
        dishImageView.image = UIImage(data: image ?? Data()) ?? defaultImage
        recipeNameLabel.text = recipeName
        countOfIngredientsLabel.text = "\(ingrCount) Ingredients"
        cookTimeLabel.text = cookTime
    }
    
    func configureWithoutRecipe() {
        dishImageView.isHidden = true
        defaultView.isHidden = false
        defaultLabel.isHidden = false
        defaultButton.isHidden = false
    }
    
    @objc private func defaultButtonDidTapped() {
        print("WORK")
    }
    
    // MARK: - Private Methods
    private func putToHierarchy() {
        addSubview(dishImageView)
        dishImageView.addSubview(recipeNameLabel)
        dishImageView.addSubview(countOfIngredientsLabel)
        dishImageView.addSubview(lineSeparatorLabel)
        dishImageView.addSubview(cookTimeLabel)
        dishImageView.addSubview(pointScoreView)

        addSubview(defaultView)
        defaultView.addSubview(defaultLabel)
        defaultView.addSubview(defaultButton)
    }
    
    private func setPointScoreLabel(score: String) {
        let scoreLabel = UILabel(frame: CGRect(x: 27, y: 4, width: 24, height: 20))
        scoreLabel.text = score
        scoreLabel.textColor = .white
        scoreLabel.font = UIFont.poppins(weight: .semibold, size: 14)
        pointScoreView.addSubview(scoreLabel)
    }
    
    private func setLayouts() {
        dishImageView.snp.makeConstraints { make in
            make.edges.equalTo(self).inset(UIEdgeInsets(
                top: 0,
                left: 15,
                bottom: 24,
                right: 15)
            )
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
        
        // default UI
        defaultView.snp.makeConstraints { make in
            make.edges.equalTo(self).inset(UIEdgeInsets(
                top: 0,
                left: 15,
                bottom: 24,
                right: 15)
            )
        }
        
        defaultLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(50)
            make.centerX.equalToSuperview()
        }
        
        defaultButton.snp.makeConstraints { make in
            make.top.equalTo(defaultLabel.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
            make.width.equalTo(220)
            make.height.equalTo(50)
        }
    }
}
