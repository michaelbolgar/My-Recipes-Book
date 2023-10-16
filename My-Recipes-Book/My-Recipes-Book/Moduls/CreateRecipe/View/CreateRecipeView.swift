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
        mainTableView.backgroundColor = .white
        mainTableView.register(
            RecipeImageCell.self,
            forCellReuseIdentifier: "imageCell"
        )
        mainTableView.register(
            NameRecipeCell.self,
            forCellReuseIdentifier: "nameCell"
        )
        mainTableView.register(
            MealDetailsCell.self,
            forCellReuseIdentifier: "mealDetailsCell"
        )
        mainTableView.register(
            NewIngredientCell.self,
            forCellReuseIdentifier: "newIngredientCell"
        )
        mainTableView.register(
            ButtonCell.self,
            forCellReuseIdentifier: "buttonCell"
        )
        return mainTableView
    }()

    // MARK: - Private Properties


    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)

        self.addSubview(mainTableView)

        mainTableView.separatorStyle = .none
        mainTableView.showsVerticalScrollIndicator = false

        let tapGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(handleTap)
        )
        self.addGestureRecognizer(tapGesture)
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

//    func deleteIngredient(at indexPath: IndexPath) {
//        ingredientData.remove(at: indexPath.row)
//
//        // Обновите таблицу с анимацией
//        mainTableView.beginUpdates()
//        mainTableView.deleteRows(at: [indexPath], with: .automatic)
//        mainTableView.endUpdates()
//    }

    // MARK: - Private Methods
    private func setupConstraints() {
        mainTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}


//// MARK: - NewIngredientCellDelegate
//extension CreateRecipeView: NewIngredientCellDelegate {
//    func didTapDeleteButton(cell: NewIngredientCell) {
//
//        if let indexPath = mainTableView.indexPath(for: cell) {
//              deleteIngredient(at: indexPath)
//          }
//    }
//}
