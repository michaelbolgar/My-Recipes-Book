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
        
        // код для удаления бага дергания ячеек после удаления
        //        createRecipeView.mainTableView.rowHeight = UITableView.automaticDimension
        
    }
    
    // MARK: - Private Methods
    // метод для добавления ингредиента в ячейку и массив
    private func addIngredient() {
        let newIngredient = NewIngredient(name: "", quantity: "")
        ingredientData.append(newIngredient)
        
        let indexPath = IndexPath(row: ingredientData.count - 1, section: 3)
        createRecipeView.insertRows(with: indexPath)
        
        createRecipeView.scrollToRow(with: indexPath)
    }
    
    // удалчения ингредиента из ячейки и массива
    private func deleteIngredient(at indexPath: IndexPath) {
        createRecipeView.endEditing(true)
        
        ingredientData.remove(at: indexPath.row)
        
        createRecipeView.deleteRows(with: indexPath)
    }
    
    // сброс всех значений в UI
    private func resetScreen() {
        createRecipeView.resetScreen()
        ingredientData.removeAll()
        createRecipeView.reloadTableView()
    }
    
    // перебираем все ячейки с ингредиентами и возвращаем массив с типом NewIngredient
    private func extractIngredients() -> [NewIngredient] {
        var ingredients: [NewIngredient] = []
        
        let section = 3
        for row in 0..<createRecipeView.getNumberOfRowsInSection(section) {
            let indexPath = IndexPath(row: row, section: section)
            let cell = createRecipeView.getCellForRowAt(indexPath) as? NewIngredientCell
            let ingredient = NewIngredient(
                name: cell?.getNameTextFieldText() ?? "",
                quantity: cell?.getQuantityTextFieldText() ?? "")
            ingredients.append(ingredient)
        }
        return ingredients
    }
    
    // поднимаем view когда выезжает клавиатура
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
    
    // показываем алерт когда рецепт создан
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
    
    private func setupConstraints() {
        createRecipeView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
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
            cell.transferDelegate(delegate: self)
            return cell
        case 2:
            guard
                let cell = tableView.dequeueReusableCell(
                    withIdentifier: MealDetailsCell.cellID,
                    for: indexPath) as? MealDetailsCell
            else {
                return UITableViewCell()
            }
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
            cell.tag = indexPath.row
            cell.transferDelegate(self)
            cell.delegate = self
            cell.selectionStyle = .none
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
                print("WORK 1")
                self?.createRecipeView.endEditing(true)
                if let text = self?.createRecipeView.getTextFromNameRecipeCell(), !text.isEmpty {
                    print("WORK 2")
                    let newRecipe = NewRecipe(
                        image: self?.currentImage,
                        name: self?.createRecipeView.getTextFromNameRecipeCell() ?? "",
                        serves: self?.currentServes ?? 0,
                        cookTime: self?.currentCookTime ?? "",
                        ingrediets: self?.extractIngredients() ?? [NewIngredient(name: "", quantity: "")]
                    )
                    
                    if let tabBarVC = self?.tabBarController as? CustomTabBarController,
                       let navController = tabBarVC.viewControllers?[4] as? UINavigationController,
                       let profileVC = navController.topViewController as? ProfileViewController {
                       print(tabBarVC)
                        print(navController)
                        print(profileVC)
                        profileVC.addNewRecipe(newRecipe)
                        self?.showAlert()
                        self?.resetScreen()
                    }
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
        : headerView.configure(with: "Ingredients", and: 20)
        
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
        
        let indexPath = createRecipeView.getIndexPathForCell(cell)
        deleteIngredient(at: indexPath)
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

// MARK: - UITextFieldDelegate
extension NewRecipeViewController: UITextFieldDelegate {
    
    // метод для нахождения родительского ячейку для текстового поля
    func getParentCell(for textField: UITextField) -> NewIngredientCell? {
        var view = textField.superview
        while view != nil {
            if let cell = view as? NewIngredientCell {
                return cell
            }
            view = view?.superview
        }
        return nil
    }
    
    // обновляем свойства в модели данных в массиве когда пользователь закончил редактирования textField
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        guard let cell = getParentCell(for: textField) else { return }
        
        let cellIndex = cell.tag
        
        switch textField.tag {
        case 100:
            ingredientData[cellIndex].name = textField.text ?? ""
        case 200:
            ingredientData[cellIndex].quantity = textField.text ?? ""
        default:
            break
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

