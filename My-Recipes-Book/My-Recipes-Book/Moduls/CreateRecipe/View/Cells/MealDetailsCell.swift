//
//  MealDetailsCell.swift
//  My-Recipes-Book
//
//  Created by Kirill Taraturin on 04.09.2023.
//

import UIKit

final class MealDetailsCell: UITableViewCell{
    
    // MARK: - Picker Properties
    private lazy var pickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        return pickerView
    }()
    
    var currentValue = ""
    var currentRow: Int?
    var cookTimes = [5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60 ]
    
    // MARK: - Private UI Properties
    private lazy var mainView: UIView = {
        var mainView = UIView()
        mainView.backgroundColor = #colorLiteral(red: 0.9450979829, green: 0.9450979829, blue: 0.9450979829, alpha: 1)
        mainView.layer.cornerRadius = 12
        return mainView
    }()
    
    private lazy var iconView: UIView = {
        var iconView = UIView()
        iconView.backgroundColor = .white
        iconView.layer.cornerRadius = 12
        return iconView
    }()
    
    private lazy var arrowImageView: UIImageView = {
        var arrowImageView = UIImageView()
        arrowImageView.image = UIImage(systemName: "arrow.right")
        arrowImageView.tintColor = .black
        return arrowImageView
    }()
    
    // MARK: - Public UI Properties
    lazy var iconImageView: UIImageView = {
        var iconImageView = UIImageView()
        iconImageView.image = UIImage(systemName: "person.2.fill")
        iconImageView.tintColor = .black
        return iconImageView
    }()
    
    lazy var nameDetailLabel: UILabel = {
        var nameDetailLabel = UILabel()
        nameDetailLabel.font = UIFont(name: "Poppins-SemiBold", size: 16)
        nameDetailLabel.textColor = .black
        return nameDetailLabel
    }()
    
    lazy var detailTextField: UITextField = {
        var detailTextField = UITextField()
        detailTextField.font = UIFont(name: "Poppins-Regular", size: 14)
        detailTextField.textColor = UIColor(red: 0.569, green: 0.569, blue: 0.569, alpha: 1)
        return detailTextField
    }()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
        
        setupConstraints()
        setupPicker(pickerView, textField: detailTextField, action: #selector(doneAction))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    func configure(_ imageName: String, detail: String, detailLabel: String, rowNumber: Int) {
        iconImageView.image = UIImage(systemName: imageName)
        nameDetailLabel.text = detail
        self.detailTextField.text = detailLabel
        self.currentRow = rowNumber
    }
    
    // MARK: - Private Actions
    @objc private func doneAction() {
        detailTextField.text = currentValue
        
        contentView.endEditing(true)
    }

    // MARK: - Private Methods
    private func setupConstraints() {
        mainView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.bottom.equalToSuperview().offset(-5)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        
        iconView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(16)
            make.width.equalTo(38)
            make.height.equalTo(38)
        }
        
        iconImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(9)
            make.bottom.equalToSuperview().offset(-9)
            make.right.equalToSuperview().offset(-9)
            make.left.equalToSuperview().offset(9)
        }
        
        nameDetailLabel.snp.makeConstraints { make in
            make.left.equalTo(iconView.snp.right).offset(16)
            make.centerY.equalTo(iconView.snp.centerY)
        }
        
        arrowImageView.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-16)
            make.centerY.equalToSuperview()
        }
        
        detailTextField.snp.makeConstraints { make in
            make.right.equalTo(arrowImageView.snp.left).offset(-16)
            make.centerY.equalToSuperview()
        }
    }
    
    private func addViews() {
        contentView.addSubview(mainView)
        mainView.addSubview(iconView)
        iconView.addSubview(iconImageView)
        mainView.addSubview(nameDetailLabel)
        mainView.addSubview(arrowImageView)
        mainView.addSubview(detailTextField)
    }
    
    private func setupPicker(_ picker: UIPickerView, textField: UITextField, action: Selector) {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        toolbar.frame.size.width = UIScreen.main.bounds.width
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: action)
        toolbar.setItems([doneButton], animated: true)
        textField.inputAccessoryView = toolbar
        textField.inputView = picker
    }
}

// MARK: - UIPickerViewDelegate, UIPickerViewDataSource
extension MealDetailsCell: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        currentRow == 0 ? 10 : cookTimes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        currentRow == 0 ? String(row) : "\(cookTimes[row]) min"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedValue = pickerView.selectedRow(inComponent: component)
        
        currentValue = currentRow == 0 ? selectedValue.formatted() : "\(cookTimes[selectedValue]) min"
    }
}

