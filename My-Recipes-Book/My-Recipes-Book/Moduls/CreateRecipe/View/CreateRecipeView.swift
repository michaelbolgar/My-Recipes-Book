//
//  CreateRecipeView.swift
//  My-Recipes-Book
//
//  Created by Михаил Болгар on 10.09.2023.
//

import UIKit

final class CreateRecipeView: UIView {
    
    // MARK: - Public UI Properties
    lazy var mainTableView: UITableView = {
        let mainTableView = UITableView(frame: self.bounds, style: .grouped)
        mainTableView.backgroundColor = .systemBackground
        mainTableView.separatorStyle = .none
        mainTableView.showsVerticalScrollIndicator = false
        mainTableView.estimatedRowHeight = 40
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
    func transferDelegates(dataSource: UITableViewDataSource, delegate: UITableViewDelegate) {
        mainTableView.dataSource = dataSource
        mainTableView.delegate = delegate
    }
    
    func insertRows(with indexPath: IndexPath) {
        mainTableView.insertRows(at: [indexPath], with: .automatic)
    }

    
    func scrollToRow(with indexPath: IndexPath) {
        mainTableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
    }
    
    func deleteRows(with indexPath: IndexPath) {
        mainTableView.deleteRows(at: [indexPath], with: .automatic)
    }

    func getTextFromNameRecipeCell() -> String? {
        guard
            let cell = mainTableView.cellForRow(at: IndexPath(row: 0, section: 1))
                as? NameRecipeCell
        else {
            return nil
        }
        return cell.getMainTextFieldText()
    }
    
    func resetScreen() {
        
        // сбрасываем изображение до default
        guard
            let imageCell = mainTableView.cellForRow(at: IndexPath(row: 0, section: 0))
                as? RecipeImageCell
        else {
            return
        }
        
        guard let image = UIImage(named: "defaultImageCell") else { return }
        imageCell.setupRecipeImageView(with: image)
        
        // сбрасываем текст в nameTextField
        guard let nameCell = mainTableView.cellForRow(at: IndexPath(row: 0, section: 1))
                as? NameRecipeCell
        else {
            return
        }
        
        nameCell.resetTextField()
        
        // сбрасываем значения в pickerView
        guard let mealDetailsCell = mainTableView.cellForRow(at: IndexPath(row: 0, section: 2))
                as? MealDetailsCell
        else {
            return
        }
        mealDetailsCell.resetPickerValue()
    }
    
    func reloadTableView() {
        mainTableView.reloadData()
    }
    
    // MARK: - Private Actions
    @objc private func handleTap() {
        endEditing(true)
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
