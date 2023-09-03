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
    
}
