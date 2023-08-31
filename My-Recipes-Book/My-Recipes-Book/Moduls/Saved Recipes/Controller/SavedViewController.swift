//
//  SavedViewController.swift
//  My-Recipes-Book
//
//  Created by Михаил Болгар on 28.08.2023.
//

import SnapKit
import UIKit

final class SavedViewController: UIViewController {
    
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
        
        self.title = "Saved Recipes"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        configureUI()
    }
    
    private func configureUI() {
        view.addSubview(tableView)
    }
    
    
    // MARK: Layout Views
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // Set tableView frame to superview bounds
        
        tableView.frame = view.bounds
        
        // make table rows resizable depend on its content
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 140
    }
}

    // MARK: TableViewDelegate

extension SavedViewController: UITableViewDelegate {
    
}

    // MARK: TableView DataSource

extension SavedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SavedTableViewCell.reuseId, for: indexPath) as? SavedTableViewCell else { return UITableViewCell() }
        return cell
    }
    
    
}
