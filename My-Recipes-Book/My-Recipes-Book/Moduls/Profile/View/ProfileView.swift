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

//    let headerView = ProfileHeaderView()

    //MARK: - UI Elements

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = .yellow
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

    //MARK: - Extensions

extension ProfileView: UITableViewDataSource {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }


    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        else {
            return 2
        }
    }
}

extension ProfileView: UITableViewDelegate {

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let headerView = ProfileHeaderView()
            return headerView
        }
        return nil
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            if section == 0 {
                return UITableView.automaticDimension
            }
            return 0
        }

}
