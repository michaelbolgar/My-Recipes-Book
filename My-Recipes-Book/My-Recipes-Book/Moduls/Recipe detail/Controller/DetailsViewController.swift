//
//  DetailsViewController.swift
//  My-Recipes-Book
//
//  Created by Михаил Болгар on 28.08.2023.
//

import Foundation
import UIKit
import SnapKit

final class DetailsViewController: UITableViewController {
    
    
    // MARK: - Public Properties
    var recipe: Recipe?
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        registerCells()
        tableView.separatorStyle = .none
        fetchRecipe(with: Link.recipeURL.rawValue)
    }
    

    // MARK: - Private Methods
    private func registerCells() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.register(MainImageCell.self, forCellReuseIdentifier: "ImageCell")
        tableView.register(IngredientCell.self, forCellReuseIdentifier: "ingredientCell")
        tableView.register(InstructionCell.self, forCellReuseIdentifier: "instructionCell")
    }
}

// MARK: - Networking
extension DetailsViewController {
    private func fetchRecipe(with url: String) {
        RecipeManager.shared.fetch(from: url) { [weak self] result in
            switch result {
            case .success(let data):
                self?.recipe = data
                self?.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}

// MARK: - UITableViewDataSource
extension DetailsViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 2 {
            return recipe?.extendedIngredients.count ?? 1
        } else {
            return section == 0 ? 1 : recipe?.analyzedInstructions.first?.steps.count ?? 1
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            guard
                let cell = tableView.dequeueReusableCell(
                    withIdentifier: "ImageCell", for: indexPath) as? MainImageCell
            else {
                return UITableViewCell()
            }
            cell.configure(with: recipe?.image ?? "")
            cell.setHighlighted(false, animated: false)
            cell.backgroundColor = .white
            return cell
        } else if indexPath.section == 2  {
            guard
                let cell = tableView.dequeueReusableCell(
                    withIdentifier: "ingredientCell", for: indexPath) as? IngredientCell
            else {
                return UITableViewCell()
            }
            let ingredient = recipe?.extendedIngredients[indexPath.row]
            

//            cell.setHighlighted(false, animated: false)
            cell.configure(with: ingredient)
            cell.backgroundColor = .white
            return cell
        } else {
            guard
                let cell = tableView.dequeueReusableCell(
                    withIdentifier: "instructionCell", for: indexPath) as? InstructionCell
            else {
                return UITableViewCell()
            }
            let step = recipe?.analyzedInstructions.first?.steps[indexPath.row]
            cell.configure(step)
            cell.backgroundColor = .white
            return cell
        }
    }
}

// MARK: - UITableViewDelegate
extension DetailsViewController {
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIView()
        headerView.backgroundColor = .white
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        headerView.addSubview(label)
        
        label.font = UIFont(name: "Poppins-Bold", size: 20)
        label.textColor = .black
        label.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        
        if section == 0 {
            label.text = "How to make \(recipe?.title ?? "")"
            label.font = UIFont(name: "Poppins-Bold", size: 24)
            label.numberOfLines = 0
            label.lineBreakMode = .byWordWrapping
        } else if section == 1 {
            label.text = "Instructions"
            label.font = UIFont(name: "Poppins-Bold", size: 20)
        } else {
            let countItemsLabel = UILabel()
            countItemsLabel.text = "\(recipe?.extendedIngredients.count ?? 0) Items"
            countItemsLabel.textColor = #colorLiteral(red: 0.5686274767, green: 0.5686274767, blue: 0.5686274767, alpha: 1)
            countItemsLabel.translatesAutoresizingMaskIntoConstraints = false
            headerView.addSubview(countItemsLabel)
            
            label.text = "Ingredients"
            
            countItemsLabel.snp.makeConstraints { make in
                make.right.equalToSuperview().offset(-16)
                make.centerY.equalToSuperview()
            }
        }
        
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        indexPath.section == 2 ? 100 : tableView.rowHeight
    }
    
    override func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? IngredientCell {
            // отработка кнопки по нажатию на ячейку
//            cell.checkBoxDidTapped()
            cell.setHighlighted(false, animated: false)
        } else if let cell = tableView.cellForRow(at: indexPath) as? MainImageCell {
            cell.setHighlighted(false, animated: false)
        } else if let cell = tableView.cellForRow(at: indexPath) as? InstructionCell {
            cell.setHighlighted(false, animated: false)
        }
    }
}


