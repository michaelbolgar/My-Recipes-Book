//
//  CreateRecipeView.swift
//  My-Recipes-Book
//
//  Created by Михаил Болгар on 10.09.2023.
//

import Foundation

import UIKit

final class CreateRecipeView: UIView {
    
    // MARK: - Public UI Properties
    lazy var mainTableView: UITableView = {
        let mainTableView = UITableView(frame: self.bounds, style: .grouped)
        mainTableView.backgroundColor = .systemBackground
        mainTableView.separatorStyle = .none
        mainTableView.showsVerticalScrollIndicator = false
        return mainTableView
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewComponents()
        setupTapGesture()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    public func transferDelegates(dataSource: UITableViewDataSource, delegate: UITableViewDelegate) {
        mainTableView.dataSource = dataSource
        mainTableView.delegate = delegate
    }
    
    // MARK: - Private Actions
    @objc private func handleTap() {
        self.endEditing(true)
    }
    
    // MARK: - Private Methods
    private func setupViewComponents() {
        addSubview(mainTableView)
        
        mainTableView.register(
            RecipeImageCell.self,
            forCellReuseIdentifier: RecipeImageCell.cellID
        )
        mainTableView.register(
            NameRecipeCell.self,
            forCellReuseIdentifier: NameRecipeCell.cellID
        )
        mainTableView.register(
            MealDetailsCell.self,
            forCellReuseIdentifier: MealDetailsCell.cellID
        )
        mainTableView.register(
            NewIngredientCell.self,
            forCellReuseIdentifier: NewIngredientCell.cellID
        )
        mainTableView.register(
            CreateButtonCell.self,
            forCellReuseIdentifier: CreateButtonCell.cellID
        )
        mainTableView.register(
            CreateRecipeSectionHeader.self,
            forHeaderFooterViewReuseIdentifier: CreateRecipeSectionHeader.reuseID
        )
        mainTableView.register(
            CreateRecipeFooterView.self,
            forHeaderFooterViewReuseIdentifier: CreateRecipeFooterView.reuseID
        )
    }
    
    // по тапу на экран сворачивается клавиатура
    private func setupTapGesture() {
        let tapGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(handleTap)
        )
        self.addGestureRecognizer(tapGesture)
    }
    
    private func setupConstraints() {
        mainTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
