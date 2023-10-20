//
//  CustomPopoverViewController.swift
//  My-Recipes-Book
//
//  Created by Kirill Taraturin on 19.10.2023.
//

import UIKit

final class CustomPopoverViewController: UIViewController {
    
    // MARK: - Private UI Properties
    private let customPopoverView = CustomPopoverView()
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setupConstraints()
        setupButtons()
    }
    
    // MARK: - Setup Button Actions
    private func setupButtons() {
        customPopoverView.buttonTouchDown = { sender in
            sender.backgroundColor = .systemGray4
            
        }
        
        customPopoverView.buttonTouchUp = { sender in
            sender.backgroundColor = .white
        }
    }
    
    // MARK: - Private Methods
    private func setViews() {
        view.addSubview(customPopoverView)
    }
    
    private func setupConstraints() {
        customPopoverView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
}
