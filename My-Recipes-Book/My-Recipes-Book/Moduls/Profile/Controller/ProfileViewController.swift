//
//  ProfileViewController.swift
//  My-Recipes-Book
//
//  Created by Михаил Болгар on 02.09.2023.
//

import Foundation
import UIKit

class ProfileViewController: UIViewController {
    //MARK: - Outlets
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "This screen is in progress of development"
        label.font = .poppins(weight: .bold, size: 24)
        label.textColor = .label
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
  //MARK: - View life cycle
    
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
