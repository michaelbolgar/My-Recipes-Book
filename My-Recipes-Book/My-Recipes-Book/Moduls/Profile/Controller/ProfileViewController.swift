//
//  ProfileViewController.swift
//  My-Recipes-Book
//
//  Created by Михаил Болгар on 02.09.2023.
//

import Foundation
import UIKit

final class ProfileViewController: UIViewController {
    //MARK: - Outlets
    private let profileView = ProfileView()
    
  //MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setConstraints()
        setupNavigationBar()
        profileView.transferDelegates(dataSource: self, delegate: self)
    }
    
    //MARK: - Methods
    
    fileprivate func setViews() {
        view.addSubview(profileView)
    }
    
    private func setConstraints() {
        profileView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "My profile"
    }
    
}

// MARK: - UITableViewDataSource
extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(
                withIdentifier: MyRecipeCell.cellID,
                for: indexPath
            )
                as? MyRecipeCell
        else {
            return UITableViewCell()
        }
        
        let image = UIImage(named: "testDishImage")!
        
        cell.configure(
            with: image,
            recipeName: "How to make yam & vegetable sauce at home",
            ingrCount: 9,
            cookTime: "25 min"
        )
        cell.selectionStyle = .none
        
        return cell
    }
    
    
}

// MARK: - UITableViewDelegate
extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 225
    }
}
