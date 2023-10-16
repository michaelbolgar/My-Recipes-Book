//
//  NewRecipeViewController.swift
//  My-Recipes-Book
//
//  Created by Михаил Болгар on 10.09.2023.
//

import Foundation
import UIKit

final class NewRecipeViewController: UIViewController {
    
    // MARK: - Private UI Properties
    private var createRecipeView = CreateRecipeView()
    private var ingredientData: [NewIngredient] = []
    
    var currentDishName: String? {
        let indexPath = IndexPath(row: 0, section: 1)
        if let cell = createRecipeView.mainTableView.cellForRow(at: indexPath) as? NameRecipeCell {
            return cell.mainTextField.text
        } else {
            return ""
        }
    }
    
    
    var currentServes: Int? {
        let indexPath = IndexPath(row: 0, section: 2)
        if let cell = createRecipeView.mainTableView.cellForRow(at: indexPath) as? MealDetailsCell {
            return Int(cell.currentValue)
        } else {
            return 0
        }
    }
    
    var currentCookTime: String? {
        let indexPath = IndexPath(row: 1, section: 2)
        if let cell = createRecipeView.mainTableView.cellForRow(at: indexPath) as? MealDetailsCell {
            return cell.currentValue
        } else {
            return ""
        }
    }
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(createRecipeView)
        
        setupConstraints()
        createRecipeView.transferDelegates(dataSource: self, delegate: self)
    }
    
    // MARK: - Private Actions
    @objc private func addIngredient() {
        let newIngredient = NewIngredient(name: "", quantity: 0)
        
        ingredientData.append(newIngredient)
        
        let indexPath = IndexPath(row: ingredientData.count - 1, section: 3)
        
        createRecipeView.mainTableView.beginUpdates()
        createRecipeView.mainTableView.insertRows(at: [indexPath], with: .automatic)
        createRecipeView.mainTableView.endUpdates()
        
        createRecipeView.mainTableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
    }
    
    func deleteIngredient(at indexPath: IndexPath) {
        ingredientData.remove(at: indexPath.row)
        
        // Обновите таблицу с анимацией
        createRecipeView.mainTableView.beginUpdates()
        createRecipeView.mainTableView.deleteRows(at: [indexPath], with: .automatic)
        createRecipeView.mainTableView.endUpdates()
    }
    
    // MARK: - Private Methods
    private func setupConstraints() {
        createRecipeView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func extractIngredients() -> [NewIngredient] {
        var ingredients: [NewIngredient] = []
        
        let section = 3
        for row in 0..<createRecipeView.mainTableView.numberOfRows(inSection: section) {
            let indexPath = IndexPath(row: row, section: section)
            if let cell = createRecipeView.mainTableView.cellForRow(at: indexPath) as? NewIngredientCell {
                if let name = cell.nameTextField.text,
                   let quantityString = cell.quantityTextField.text,
                   let quantity = Int(quantityString) {
                    let ingredient = NewIngredient(name: name, quantity: quantity)
                    ingredients.append(ingredient)
                }
            }
        }
        
        return ingredients
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
                let cell = createRecipeView.mainTableView.dequeueReusableCell(
                    withIdentifier: "imageCell",
                    for: indexPath) as? RecipeImageCell
            else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            return cell
        case 1:
            guard
                let cell = createRecipeView.mainTableView.dequeueReusableCell(
                    withIdentifier: "nameCell",
                    for: indexPath) as? NameRecipeCell
            else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            return cell
        case 2:
            guard
                let cell = createRecipeView.mainTableView.dequeueReusableCell(
                    withIdentifier: "mealDetailsCell",
                    for: indexPath) as? MealDetailsCell
            else {
                return UITableViewCell()
            }
            
            if indexPath.row == 0 {
                cell.configure("person.2.fill", detail: "Serves", detailLabel: "1", rowNumber: 0)
                cell.selectionStyle = .none
                return cell
            } else {
                cell.configure("clock.fill", detail: "Cook time", detailLabel: "20 min", rowNumber: 1)
                cell.selectionStyle = .none
                return cell
            }
        case 3:
            guard
                let cell = createRecipeView.mainTableView.dequeueReusableCell(
                    withIdentifier: "newIngredientCell",
                    for: indexPath) as? NewIngredientCell
            else {
                return UITableViewCell()
            }
            cell.tableView = createRecipeView.mainTableView
            cell.delegate = self
            return cell
            
        default:
            guard
                let cell = createRecipeView.mainTableView.dequeueReusableCell(
                    withIdentifier: "buttonCell",
                    for: indexPath) as? ButtonCell
            else {
                return UITableViewCell()
            }
            cell.actionButton = { [weak self] in
                
                
                let newRecipe = NewRecipe(
                    image: "123",
                    name: self?.currentDishName ?? "",
                    serves: self?.currentServes ?? 0,
                    cookTime: self?.currentCookTime ?? "",
                    ingrediets: self?.extractIngredients() ?? [NewIngredient(name: "", quantity: 0)]
                )
                
                print(newRecipe)
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
        let headerView = UIView()
        headerView.backgroundColor = .white
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        headerView.addSubview(label)
        
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = .black
        label.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        
        switch section {
        case 0:
            label.text = "Create Recipe"
            label.font = UIFont(name: "Poppins-SemiBold", size: 24)
        case 3:
            label.text = "Ingredients"
            label.font = UIFont(name: "Poppins-SemiBold", size: 20)
        default:
            break
        }
        
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
            let footerView = UIView()
            
            let button = UIButton(type: .custom)
            button.setTitle("Add new ingredient", for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.titleLabel?.font = UIFont(name: "Poppins-SemiBold", size: 16)
            button.addTarget(self, action: #selector(addIngredient), for: .touchUpInside)
            
            let plusImage = UIImage(named: "plus")
            let plusImageView = UIImageView(image: plusImage)
            plusImageView.tintColor = .black
            
            button.addSubview(plusImageView)
            
            plusImageView.snp.makeConstraints { make in
                make.centerY.equalTo(button.snp.centerY)
                make.left.equalTo(button.snp.left)
                make.width.equalTo(20)
                make.height.equalTo(20)
            }
            
            footerView.addSubview(button)
            
            button.snp.makeConstraints { make in
                make.centerY.equalTo(footerView.snp.centerY)
                make.left.equalTo(footerView.snp.left).offset(16)
                make.right.equalTo(footerView.snp.right).offset(-140)
            }
            
            return footerView
        }
        
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return section == 3 ? 50.0 : 0.0
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
