//
//  MealDetailsCell.swift
//  My-Recipes-Book
//
//  Created by Kirill Taraturin on 04.09.2023.
//

import UIKit

final class MealDetailsCell: UITableViewCell {
    
    // MARK: - UI Properties
    lazy var iconView: UIView = {
        var iconView = UIView()
        
        return iconView
    }()

    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override Methods
    override func setSelected(_ selected: Bool, animated: Bool) {
        // отключаем выделение ячейки
    }
    
    // MARK: - Public Methods
    
    // MARK: - Private Methods
    private func setupConstraints() {
        
    }
    
}
