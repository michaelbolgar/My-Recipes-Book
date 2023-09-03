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
        mainTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
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
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mainTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        return cell
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
        
        label.font = UIFont(name: "Poppins-Bold", size: 20)
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
            label.font = UIFont(name: "Poppins-Bold", size: 24)
            label.numberOfLines = 0
            label.lineBreakMode = .byWordWrapping

        default:
            let countItemsLabel = UILabel()
            countItemsLabel.text = ""
            countItemsLabel.textColor = .systemGray
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
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        indexPath.section == 2 ? 100 : tableView.rowHeight
    }
    
    
}
