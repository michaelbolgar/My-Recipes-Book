//
//  NotificationsViewController.swift
//  My-Recipes-Book
//
//  Created by Дмитрий Лоренц on 12.09.2023.
//

import UIKit

class NotificationsViewController: UIViewController {
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "This screen is in progress of development"
        label.font = .poppins(weight: .bold, size: 24)
        label.textColor = .label
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setConstraints()
    }
    
//MARK: - Methods
    
    fileprivate func setViews() {
        view.addSubview(label)
    }

    private func setConstraints() {
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
