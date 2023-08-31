//
//  TrendingView.swift
//  My-Recipes-Book
//
//  Created by Nickolay Vasilchenko on 28.08.2023.
//

import Foundation
import UIKit
import SnapKit

class TrandingNowView: UIView {
// MARK: - UI element
    private var trandingRecipesUITable = UITableView()

// MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        putToHierarchy()
        setLayouts()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
// MARK: - View preparation
    private func setupView() {
        self.backgroundColor = .white
        trandingRecipesUITable.register(TrandRecipeCell.self, forCellReuseIdentifier: TrandRecipeCell.cellID)
    }

    private func putToHierarchy() {
        self.addSubview(trandingRecipesUITable)
    }

    private func setLayouts() {
        trandingRecipesUITable.snp.makeConstraints { make in
            make.width.equalTo(self)
            make.height.equalTo(self)
            make.center.equalTo(self)
        }
    }
// MARK: - Public interface
    public func transferDelegates(dataSourse: UITableViewDataSource, delegate: UITableViewDelegate) {
        trandingRecipesUITable.dataSource = dataSourse
        trandingRecipesUITable.delegate = delegate
    }
}
