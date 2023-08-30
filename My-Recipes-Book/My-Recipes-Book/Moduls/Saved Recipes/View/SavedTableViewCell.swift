//
//  SavedTableViewCell.swift
//  My-Recipes-Book
//
//  Created by admin on 29.08.2023.
//

import UIKit

final class SavedTableViewCell: UITableViewCell {
    
    static var reuseId: String {
        String(describing: Self.self)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
