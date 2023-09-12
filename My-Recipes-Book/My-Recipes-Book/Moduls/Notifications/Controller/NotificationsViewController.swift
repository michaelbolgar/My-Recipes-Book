//
//  NotificationsViewController.swift
//  My-Recipes-Book
//
//  Created by Дмитрий Лоренц on 12.09.2023.
//

import UIKit

class NotificationsViewController: UIViewController {
    
    private var label: UILabel {
        let label = UILabel()
        label.text = "This screen is in progress of development"
        label.font = .poppins(weight: .bold, size: 24)
        label.numberOfLines = 0
        return label
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        
    }
    
//MARK: - Methods
    
    fileprivate func setViews() {
        view.addSubview(label)
    }

    private func setConstraints() {
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
