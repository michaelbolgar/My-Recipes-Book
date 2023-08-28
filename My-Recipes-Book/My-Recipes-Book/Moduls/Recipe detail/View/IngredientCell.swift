//
//  IngredientCell.swift
//  My-Recipes-Book
//
//  Created by Kirill Taraturin on 28.08.2023.
//

import UIKit

class IngredientCell: UITableViewCell {
    
    // MARK: - Public UI Properties
    lazy var ingredientImageView: UIImageView = {
        var ingredientImageView = UIImageView()
        ingredientImageView.image = UIImage(named: "Fish")
        ingredientImageView.translatesAutoresizingMaskIntoConstraints = false
        return ingredientImageView
    }()
    
    lazy var ingredientNameLabel: UILabel = {
        var ingrLabel = UILabel()
        ingrLabel.text = "Fish"
        ingrLabel.textColor = .black
        ingrLabel.font = UIFont(name: "Poppins-Bold", size: 17)
        ingrLabel.translatesAutoresizingMaskIntoConstraints = false
        return ingrLabel
    }()
    
    lazy var weightLabel: UILabel = {
        var weightLabel = UILabel()
        weightLabel.text = "250g"
        weightLabel.textColor = #colorLiteral(red: 0.5686274767, green: 0.5686274767, blue: 0.5686274767, alpha: 1)
        weightLabel.translatesAutoresizingMaskIntoConstraints = false
        return weightLabel
    }()
    
    // MARK: - Private UI Properties
    private lazy var mainView: UIView = {
        var mainView = UIView()
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.backgroundColor = #colorLiteral(red: 0.9450981021, green: 0.9450979829, blue: 0.9450979829, alpha: 1)
        mainView.layer.cornerRadius = 10
        return mainView
    }()
    
    private lazy var squareView: UIView = {
        var squareView = UIView()
        squareView.backgroundColor = .white
        squareView.layer.cornerRadius = 10
        squareView.translatesAutoresizingMaskIntoConstraints = false
        return squareView
    }()
    
    private lazy var checkBoxButton: UIButton = {
        var checkBox = UIButton(type: .system)
        checkBox.translatesAutoresizingMaskIntoConstraints = false
        checkBox.setImage(UIImage(named: "blackCheckBox"), for: .normal)
        checkBox.tintColor = .black
        checkBox.addTarget(
            self,
            action: #selector(checkBoxDidTapped),
            for: .touchUpInside
        )
        return checkBox
    }()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(mainView)
        mainView.addSubview(squareView)
        squareView.addSubview(ingredientImageView)
        mainView.addSubview(ingredientNameLabel)
        mainView.addSubview(checkBoxButton)
        mainView.addSubview(weightLabel)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func setupConstraints() {
        //setup constraints to mainView
        mainView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview().offset(16)
            make.bottom.equalToSuperview().offset(-10)
            make.right.equalToSuperview().offset(-16)
        }
        
        // setup constraints to squareView
        squareView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(16)
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
        
        // setup constraints to ingredientImageView
        ingredientImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        // setup constraints to ingredientImageView
        ingredientNameLabel.snp.makeConstraints { make in
            make.centerY.equalTo(squareView)
            make.left.equalTo(squareView.snp.right).offset(15)
        }
        
        // setup constraints to ingredientImageView
        checkBoxButton.snp.makeConstraints { make in
            make.centerY.equalTo(squareView)
            make.right.equalTo(mainView.snp.right).offset(-16)
        }
        
        // setup constraints to ingredientImageView
        weightLabel.snp.makeConstraints { make in
            make.centerY.equalTo(squareView)
            make.right.equalTo(checkBoxButton.snp.left).offset(-16)
        }
        
    }
    
    // MARK: - Private Actions
    @objc private func checkBoxDidTapped() {
        checkBoxButton.tintColor = checkBoxButton.tintColor == .black ? .red : .black
    }
    
}
