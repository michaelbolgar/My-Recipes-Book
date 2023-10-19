//
//  ProfileView.swift
//  My-Recipes-Book
//
//  Created by Kirill Taraturin on 18.10.2023.
//

import UIKit

final class ProfileView: UIView {
    
    // MARK: - Private UI Properties
    private lazy var profileImageView: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(named: "profileImage")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var recipeLabel: UILabel = {
        var label = UILabel()
        label.text = "My recipes"
        label.font = UIFont.poppins(weight: .semibold, size: 24)
        label.textColor = Palette.neutral100
        return label
    }()
    
    private lazy var mainTableView: UITableView = {
        let tableView = UITableView(frame: self.bounds, style: .grouped)
        tableView.backgroundColor = .systemBackground
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
//        tableView.estimatedRowHeight = 40
        tableView.register(MyRecipeCell.self, forCellReuseIdentifier: MyRecipeCell.cellID)
        return tableView
        
    }()

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(profileImageView)
        addSubview(recipeLabel)
        addSubview(mainTableView)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    func transferDelegates(dataSource: UITableViewDataSource, delegate: UITableViewDelegate) {
        mainTableView.dataSource = dataSource
        mainTableView.delegate = delegate
    }
    
    func reloadTableView() {
        mainTableView.reloadData()
    }
    
    // MARK: - Private Methods
    private func setupConstraints() {
        profileImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.left.equalToSuperview().offset(16)
            make.width.equalTo(80)
            make.height.equalTo(80)
        }
        
        recipeLabel.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(48)
            make.left.equalToSuperview().offset(36)
        }
        
        mainTableView.snp.makeConstraints { make in
            make.top.equalTo(recipeLabel.snp.bottom)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}
