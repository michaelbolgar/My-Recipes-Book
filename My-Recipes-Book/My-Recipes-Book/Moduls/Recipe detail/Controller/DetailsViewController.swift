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
    private var recipe: Results?
    private var recipeID: Int?
    private var recipeURLbyID: String { "https://api.spoonacular.com/recipes/\(recipeID ?? 715449)/information?apiKey=5ae93d38d7cf4f94912465f822fa82eb&includeNutrition=false"
    }
    
    private var myRecipe: NewRecipe?
    
    //MARK: - Init
    convenience init(id: Int){
        self.init()
        recipeID = id
    }
    
    convenience init(myRecipe: NewRecipe) {
        self.init()
        self.myRecipe = myRecipe
    }
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setupConstraints()
        
        if myRecipe == nil {
            fetchRecipe(with: recipeURLbyID)
        } else {
            setupNewRecipe()
        }
      
        
    }
    
    // MARK: - Private Methods
    
    private func setupNewRecipe() {
        contentView.myRecipe = myRecipe
    }
    
    private func setViews() {
        view.addSubview(contentView)
        //set back button image
        let backBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "Arrow-Left"),
            style: .done,
            target: self,
            action: #selector(backButtonAction)
        )
        backBarButtonItem.tintColor = UIColor.black
        navigationItem.leftBarButtonItem = backBarButtonItem
    }
    
    @objc private func backButtonAction() {
        navigationController?.popViewController(animated: true)
    }
    
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

