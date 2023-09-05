//
//  SavedViewController.swift
//  My-Recipes-Book
//
//  Created by Михаил Болгар on 28.08.2023.
//

import SnapKit
import UIKit

final class SavedViewController: UIViewController {
    
    private let data = Array(repeating: Model(recipeImage: "RecipeImage", score: "5.0", time: "15:10", recipeName: "How to make Shawrma at home?", authorImage: "AuthorImage", authorLabel: "By Zeelicious Food"), count: 10)
    
    // MARK: Table View with saved recipes
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(SavedTableViewCell.self, forCellReuseIdentifier: SavedTableViewCell.reuseId)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Saved Recipes"

        configureUI()
    }
    
    private func configureUI() {
        view.addSubview(tableView)
    }
    
    
    // MARK: Layout Views
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // Set tableView frame to superview bounds
        tableView.frame = view.frame
        
        // make table rows resizable depend on its content
        tableView.estimatedRowHeight = 275
        tableView.rowHeight = UITableView.automaticDimension
    }
}

    // MARK: TableViewDelegate

extension SavedViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.delegate?.tableView(self, didDeselectRowAt: indexPath)
//    }
}

    // MARK: TableView DataSource

extension SavedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SavedTableViewCell.reuseId, for: indexPath) as? SavedTableViewCell else { return UITableViewCell() }
        let recipe = data[indexPath.row]
        cell.configureCell(with: recipe)
        return cell
    }
}
