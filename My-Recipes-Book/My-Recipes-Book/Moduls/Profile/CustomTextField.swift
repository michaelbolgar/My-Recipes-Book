//
//  CustomTextField.swift
//  My-Recipes-Book
//
//  Created by Kirill Taraturin on 24.10.2023.
//

import UIKit

class CustomTextField: UITextField {

    // MARK: - Enum
    enum CustomTextFieldType {
        case withEyeButton
        case withoutEyeButton
    }
    
    // MARK: - Private Properties
    private let authFieldType: CustomTextFieldType
    let customEyeButton = UIButton(type: .custom)
    
    // MARK: - Init
    init(fieldType: CustomTextFieldType, placeholder: String, border: Bool) {
        self.authFieldType = fieldType
        super.init(frame: .zero)
        
        self.placeholder = placeholder
        self.backgroundColor = UIColor.systemGray6
//        self.layer.cornerRadius = 5
        self.returnKeyType = .done
        self.autocorrectionType = .no
        self.autocapitalizationType = .none
        
        self.leftViewMode = .always
        self.leftView = UIView(frame: CGRect(
            x: 0, y: 0, width: 15,
            height: self.frame.size.height)
        )
        let placeholderText = NSAttributedString(
            string: placeholder,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray]
        )
        self.attributedPlaceholder = placeholderText
        
        
        if border {
            self.layer.borderColor = UIColor.systemGray2.cgColor
            self.layer.borderWidth = 1
        }
        
        switch fieldType {
            
        case .withEyeButton:
            let rightView = UIView()
            rightView.frame = CGRect(x: 0, y: 0, width: 50, height: 40)
            
            
            customEyeButton.setImage(UIImage(systemName: "eye.fill"), for: .normal)
            customEyeButton.frame = CGRect(x: 10, y: 10, width: 23, height: 20)
            customEyeButton.tintColor = UIColor.systemGray2
            
            customEyeButton.addTarget(
                self,
                action: #selector(toggleTextVisibility),
                for: .touchUpInside
            )
            
            rightView.addSubview(customEyeButton)
            self.rightView = rightView
            self.rightViewMode = .always
        case .withoutEyeButton:
            self.layer.cornerRadius = 10
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Actions
    @objc private func toggleTextVisibility(_ sender: UIButton) {
        if let textField = sender.superview?.superview as? UITextField {
            textField.isSecureTextEntry.toggle()
            
            let image = textField.isSecureTextEntry
            ? UIImage(systemName: "eye.slash.fill")
            : UIImage(systemName: "eye.fill")
            
            sender.setImage(image, for: .normal)
        }
    }

}
