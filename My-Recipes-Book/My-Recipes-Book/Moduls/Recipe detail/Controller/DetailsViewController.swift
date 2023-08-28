//
//  DetailsViewController.swift
//  My-Recipes-Book
//
//  Created by Михаил Болгар on 28.08.2023.
//

import Foundation
import UIKit
import SnapKit

class DetailsViewController: UITableViewController {
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.register(MainImageCell.self, forCellReuseIdentifier: "ImageCell")
        //        tableView.separatorStyle = .none
    }
}

// MARK: - UITableViewDataSource
extension DetailsViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCell", for: indexPath) as? MainImageCell else { return UITableViewCell() }
            
            cell.backgroundColor = .white
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            
            cell.backgroundColor = .white
            return cell
        }
    }
}

// MARK: - UITableViewDelegate
extension DetailsViewController {
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        let label = UILabel()
        
        headerView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }

        if section == 0 {
            label.text = "How to make Tasty Fish (point & Kill)"
            label.font = UIFont.boldSystemFont(ofSize: 27)
            label.textColor = .black
            label.numberOfLines = 0
            label.lineBreakMode = .byWordWrapping
            
            return headerView
        } else if section == 1 {
            
            label.text = "Instructions"
            label.font = UIFont.boldSystemFont(ofSize: 20)
            label.textColor = .black
            return headerView
        } else {
            label.text = "Ingredients"
            label.font = UIFont.boldSystemFont(ofSize: 20)
            label.textColor = .black
            return headerView
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return CGFloat(260)
        } else {
            return 50
        }
    }
}
