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
        mainTableView.register(NewIngredientCell.self, forCellReuseIdentifier: "newIngredientCell")
        return mainTableView
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(mainTableView)
        
        mainTableView.separatorStyle = .none
        mainTableView.showsVerticalScrollIndicator = false
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
            cell.selectionStyle = .none
            return cell
        case 1:
            guard
                let cell = mainTableView.dequeueReusableCell(
                    withIdentifier: "nameCell",
                    for: indexPath) as? NameRecipeCell
            else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
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
                cell.configure("person.2.fill", detail: "Serves", detailLabel: "03")
                cell.selectionStyle = .none
                return cell
            } else {
                cell.configure("clock.fill", detail: "Cook time", detailLabel: "20 min")
                cell.selectionStyle = .none
                return cell
            }
            
        default:
            guard
                let cell = mainTableView.dequeueReusableCell(
                    withIdentifier: "newIngredientCell",
                    for: indexPath) as? NewIngredientCell
            else {
                return UITableViewCell()
            }
            return cell
        }
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
        } else if section == 3 {
            label.text = "Ingredients"
            label.font = UIFont(name: "Poppins-SemiBold", size: 20)
            label.numberOfLines = 0
            label.lineBreakMode = .byWordWrapping
            
            label.textColor = .black
            label.snp.makeConstraints { make in
                make.top.equalToSuperview()
                make.bottom.equalToSuperview()
                make.left.equalToSuperview().offset(16)
                make.right.equalToSuperview().offset(-16)
            }
        }
        return headerView
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        //        UITableView.automaticDimension
        if section == 1 {
            return 0
        } else if section == 2{
            return 0
        } else if section == 3{
            return 45
        } else {
            return 60
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //        indexPath.section == 2 ? 100 : tableView.rowHeight
        if indexPath.section == 1 {
            return 50
        } else if indexPath.section == 2 {
            return 80
        } else if indexPath.section == 3 {
            return 65
        } else {
            return UITableView.automaticDimension
            
        }
        //                UITableView.automaticDimension
    }
    
    // MARK: - Footer
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section == 3 {
            let footerView = UIView()
            footerView.backgroundColor = .white
            
            // Создайте и настройте элементы интерфейса для вашего футера
            let button = UIButton(type: .custom)
            button.setTitle("Add new ingredient", for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.titleLabel?.font = UIFont(name: "Poppins-SemiBold", size: 16)
            
            let plusImage = UIImage(named: "plus")
            let plusImageView = UIImageView(image: plusImage)
            plusImageView.tintColor = .black // Настройте цвет изображения
            
            button.addSubview(plusImageView)
            
            plusImageView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                plusImageView.centerYAnchor.constraint(equalTo: button.centerYAnchor),
                plusImageView.leadingAnchor.constraint(equalTo: button.leadingAnchor),
                plusImageView.widthAnchor.constraint(equalToConstant: 20), // Ширина изображения
                plusImageView.heightAnchor.constraint(equalToConstant: 20) // Высота изображения
            ])
            //            button.addTarget(self, action: #selector(addIngredientButtonTapped), for: .touchUpInside)
            
            
            footerView.addSubview(button)
            button.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                button.centerYAnchor.constraint(equalTo: footerView.centerYAnchor),
                button.leadingAnchor.constraint(equalTo: footerView.leadingAnchor, constant: 16), // Расстояние от левого края
                button.trailingAnchor.constraint(equalTo: footerView.trailingAnchor, constant: -160) // Расстояние от правого края
            ])
            
            return footerView
        }
        
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 3 {
            // Установите желаемую высоту для вашего футера
            return 50.0 // Измените на нужное значение
        }
        
        return 0.0 // Возвращает 0 для всех остальных секций
    }
    
    
    
}
