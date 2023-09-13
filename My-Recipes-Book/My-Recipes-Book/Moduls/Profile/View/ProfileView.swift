//
//  ProfileView.swift
//  My-Recipes-Book
//
//  Created by Михаил Болгар on 12.09.2023.
//

import Foundation
import UIKit
import SnapKit

class ProfileView: UIView {

    //MARK: - Properties


    //MARK: - UI Elements

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = .white
//        tableView.dataSource = self
//        tableView.delegate = self
//        tableView.register(CellName.self, forCellReuseIdentifier: <#T##String#>)
        tableView.sectionHeaderHeight = 0
        return tableView
    }()

    //MARK: - Init

    override init (frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - Methods

    private func layout() {
        self.addSubview(tableView)

        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
