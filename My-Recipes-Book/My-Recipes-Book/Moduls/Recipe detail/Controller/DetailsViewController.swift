//
//  DetailsViewController.swift
//  My-Recipes-Book
//
//  Created by Михаил Болгар on 28.08.2023.
//

import UIKit
import SnapKit

final class DetailsViewController: UIViewController {
    
    // MARK: - Private Properties
    private let contentView = ContentView()
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(contentView)
        setupConstraints()
        fetchRecipe(with: Link.recipeURL.rawValue)
    }
    
    // MARK: - Private Methods
    private func setupConstraints() {
        contentView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}

// MARK: - Networking
extension DetailsViewController {
    private func fetchRecipe(with url: String) {
        RecipeManager.shared.fetch(from: url) { [weak self] result in
            switch result {
            case .success(let data):
                self?.contentView.recipe = data
                self?.contentView.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}

