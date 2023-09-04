//
//  CreateRecipeView.swift
//  My-Recipes-Book
//
//  Created by Kirill Taraturin on 03.09.2023.
//

import UIKit

final class CreateRecipeView: UIView {
    
    lazy var mainTableView: UITableView = {
        let mainTableView = UITableView(frame: self.bounds, style: .grouped)
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.backgroundColor = .white
        mainTableView.register(RecipeImageCell.self, forCellReuseIdentifier: "imageCell")
        mainTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        mainTableView.register(NameRecipeCell.self, forCellReuseIdentifier: "nameCell")
        mainTableView.register(MealDetailsCell.self, forCellReuseIdentifier: "mealDetailsCell")
        return mainTableView
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(mainTableView)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func setupConstraints() {
        mainTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

// MARK: - UITableViewDataSource
extension CreateRecipeView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        4
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 2 {
            return 2
        } else {
            return 1
        }

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            guard
                let cell = mainTableView.dequeueReusableCell(
                    withIdentifier: "imageCell",
                    for: indexPath) as? RecipeImageCell
            else {
                return UITableViewCell()
            }
            return cell
        case 1:
            guard
                let cell = mainTableView.dequeueReusableCell(
                    withIdentifier: "nameCell",
                    for: indexPath) as? NameRecipeCell
            else {
                return UITableViewCell()
            }
            
            return cell
        case 2:
            guard
                let cell = mainTableView.dequeueReusableCell(
                    withIdentifier: "mealDetailsCell",
                    for: indexPath) as? MealDetailsCell
            else {
                return UITableViewCell()
            }
            
            if indexPath.row == 0 {
                cell.configure("person.2.fill")
                return cell
            } else {
                cell.configure("clock.fill")
                return cell
            }
       
        
        default:
            let cell = mainTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            return cell
            
            
        }
//        return UITableViewCell()
    }
}

// MARK: - UITableViewDelegate
extension CreateRecipeView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIView()
        headerView.backgroundColor = .white

        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        headerView.addSubview(label)

          
        if section == 0 {
     
            label.text = "Create Recipe"
            label.font = UIFont(name: "Poppins-SemiBold", size: 24)
            label.numberOfLines = 0
            label.lineBreakMode = .byWordWrapping

            label.textColor = .black
            label.snp.makeConstraints { make in
                make.top.equalToSuperview()
                make.bottom.equalToSuperview()
                make.left.equalToSuperview().offset(16)
                make.right.equalToSuperview().offset(-16)
            }
            
         return headerView
        }
    return headerView

       
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        UITableView.automaticDimension
        if section == 1 {
            return 0
        } else if section == 2{
            return 0
        } else {
            return 60
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        indexPath.section == 2 ? 100 : tableView.rowHeight
        if indexPath.section == 1 {
            return 50
        } else if indexPath.section == 2 {
           return 70
        } else {
            return UITableView.automaticDimension
        }
//                UITableView.automaticDimension
    }
    
    
}
