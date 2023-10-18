//
//  NewRecipeViewController.swift
//  My-Recipes-Book
//
//  Created by Михаил Болгар on 10.09.2023.
//

import UIKit

final class NewRecipeViewController: UIViewController {
    
    // MARK: - Private UI Properties
    private var createRecipeView = CreateRecipeView()
    
    // MARK: - Private Properties
    private var ingredientData: [NewIngredient] = []
    private var currentImage: Data?
    private var currentDishName: String?
    private var currentServes: Int?
    private var currentCookTime: String?
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(createRecipeView)
        setupConstraints()
        createRecipeView.transferDelegates(dataSource: self, delegate: self)
        addObservers()
    }
    
//    // MARK: - Override methods
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        super.touchesBegan(touches, with: event)
//        view.endEditing(true)
//
//    }
    
    // MARK: - Private Methods
    private func addIngredient() {
        // cоздаем пустой экзепляр NewIngredient
        let newIngredient = NewIngredient(name: "", quantity: "")
        
        // добавляем в массив
        ingredientData.append(newIngredient)
        
        // создаем индекс куда вставить новую ячейку
        let indexPath = IndexPath(row: ingredientData.count - 1, section: 3)
        
        // вставляем ячейку в таблицу
        createRecipeView.insertRows(with: indexPath)
        
        // прокручиваем скрол к новой ячейке
        createRecipeView.scrollToRow(with: indexPath)
    }
    
    private func deleteIngredient(at indexPath: IndexPath) {
        // удаляем ингредиент из массива
        ingredientData.remove(at: indexPath.row)
        
        // удалем ячейку из таблицы
        createRecipeView.deleteRows(with: indexPath)
        
    }
    
    private func resetScreen() {
        createRecipeView.resetScreen()
        ingredientData.removeAll()
        createRecipeView.reloadTableView()
    }
    
    // перебираем все ячейки с ингредиентами и возвращаем массив с типом NewIngredient
    private func extractIngredients() -> [NewIngredient] {
        var ingredients: [NewIngredient] = []
        
        let section = 3
        for row in 0..<createRecipeView.mainTableView.numberOfRows(inSection: section) {
            let indexPath = IndexPath(row: row, section: section)
            if let cell = createRecipeView.mainTableView.cellForRow(at: indexPath) as? NewIngredientCell {
                let ingredient = NewIngredient(
                    name: cell.getNameTextFieldText(),
                    quantity: cell.getQuantityTextFieldText())
                
                ingredients.append(ingredient)
            }
        }
        return ingredients
    }
    
    private func setupConstraints() {
        createRecipeView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func addObservers() {
        NotificationCenter.default.addObserver(
            forName: UIResponder.keyboardWillShowNotification,
            object: nil,
            queue: nil) { _ in
                self.view.frame.origin.y = -200
            }
        
        NotificationCenter.default.addObserver(
            forName: UIResponder.keyboardWillHideNotification,
            object: nil,
            queue: nil) { _ in
                self.view.frame.origin.y = 0
            }
    }
    
    private func showAlert() {
        let alert = UIAlertController(
            title: "Successfully",
            message: "Your recipe has been saved",
            preferredStyle: .alert
        )
        
        let okAction = UIAlertAction(title: "Ok", style: .default)
        
        alert.addAction(okAction)
        
        present(alert, animated: true)
    }
    
}

// MARK: - UITableViewDataSource
extension NewRecipeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 2 {
            return 2
        } else if section == 3 {
            return ingredientData.count
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            guard
                let cell = tableView.dequeueReusableCell(
                    withIdentifier: RecipeImageCell.cellID,
                    for: indexPath) as? RecipeImageCell
            else {
                return UITableViewCell()
            }
            // устанавливаем viewController в качестве делегата
            cell.delegate = self
            cell.selectionStyle = .none
            return cell
        case 1:
            guard
                let cell = tableView.dequeueReusableCell(
                    withIdentifier: NameRecipeCell.cellID,
                    for: indexPath) as? NameRecipeCell
            else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            return cell
        case 2:
            guard
                let cell = tableView.dequeueReusableCell(
                    withIdentifier: MealDetailsCell.cellID,
                    for: indexPath) as? MealDetailsCell
            else {
                return UITableViewCell()
            }
            // устанавливаем viewController в качестве делегата
            cell.delegate = self
            
            if indexPath.row == 0 {
                cell.configure("person.2.fill", detail: "Serves", detailLabel: "1", type: .serves)
                cell.selectionStyle = .none
                return cell
            } else {
                cell.configure("clock.fill", detail: "Cook time", detailLabel: "20 min", type: .cookTimes)
                cell.selectionStyle = .none
                return cell
            }
        case 3:
            guard
                let cell = tableView.dequeueReusableCell(
                    withIdentifier: NewIngredientCell.cellID,
                    for: indexPath) as? NewIngredientCell
            else {
                
                return UITableViewCell()
            }
            
            let value = ingredientData[indexPath.row]
            cell.configure(with: value)
            // устанавливаем viewController в качестве делегата
            cell.delegate = self
            return cell
            
        default:
            guard
                let cell = tableView.dequeueReusableCell(
                    withIdentifier: CreateButtonCell.cellID,
                    for: indexPath) as? CreateButtonCell
            else {
                return UITableViewCell()
            }
            cell.actionButton = { [weak self] in
                if let text = self?.createRecipeView.getTextFromNameRecipeCell(), text != "" {
                    let newRecipe = NewRecipe(
                        image: self?.currentImage,
                        name: self?.currentDishName ?? "",
                        serves: self?.currentServes ?? 0,
                        cookTime: self?.currentCookTime ?? "",
                        ingrediets: self?.extractIngredients() ?? [NewIngredient(name: "", quantity: "")]
                    )
                    
                    self?.showAlert()
                    self?.resetScreen()
                }
            }
            return cell
        }
    }
}

// MARK: - UITableViewDelegate
extension NewRecipeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 1:
            return 50
        case 2:
            return 80
        case 3:
            return 65
        case 4:
            return 70
        default:
            return 240
        }
    }
}

// MARK: - HeaderView
extension NewRecipeViewController{
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard
            let headerView = tableView.dequeueReusableHeaderFooterView(
                withIdentifier: CreateRecipeSectionHeader.reuseID)
                as? CreateRecipeSectionHeader
        else {
            return UITableViewHeaderFooterView()
        }
        
        section == 0
        ? headerView.configure(with: "Create Recipe", and: 24)
        :  headerView.configure(with: "Ingredients", and: 20)
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
            
        case 0:
            return 60
        case 3:
            return 45
        default:
            return 0
        }
    }
}

// MARK: - FooterView
extension NewRecipeViewController {
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section == 3 {
            guard
                let footerView = tableView.dequeueReusableHeaderFooterView(
                    withIdentifier: CreateRecipeFooterView.reuseID)
                    as? CreateRecipeFooterView
            else {
                return UITableViewHeaderFooterView()
            }
            
            footerView.delegate = self
            return footerView
            
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        section == 3 ? 50.0 : 0.0
    }
}

// MARK: - NewIngredientCellDelegate
extension NewRecipeViewController: NewIngredientCellDelegate {
    func didTapDeleteButton(cell: NewIngredientCell) {
        
        if let indexPath = createRecipeView.mainTableView.indexPath(for: cell) {
            deleteIngredient(at: indexPath)
        }
    }
}

// MARK: - MealDetailsCellDelegate
extension NewRecipeViewController: MealDetailsCellDelegate {
    func didPickValue(_ value: String) {
        if let servesValue = Int(value) {
            currentServes = servesValue
        } else {
            currentCookTime = value
        }
    }
}

// MARK: - RecipeImageCellDelegate
extension NewRecipeViewController: RecipeImageCellDelegate {
    func didPickImage(_ image: UIImage) {
        currentImage = image.pngData()
    }
}

// MARK: - nameCreateRecipeFooterViewDelegate
extension NewRecipeViewController: CreateRecipeFooterViewDelegate {
    func addNewIngredient() {
        addIngredient()
    }
}
