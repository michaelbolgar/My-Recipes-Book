//
//  InstructionCell.swift
//  My-Recipes-Book
//
//  Created by Kirill Taraturin on 28.08.2023.
//

import UIKit

final class InstructionCell: UITableViewCell {
    
    // MARK: - UIProperties
    lazy var numberLabel: UILabel = {
        var numberLabel = UILabel()
        numberLabel.textColor = .black
        return numberLabel
    }()
    
    lazy var instructionLabel: UILabel = {
        var instructionLabel = UILabel()
        instructionLabel.numberOfLines = 0
        instructionLabel.textColor = .black
        return instructionLabel
    }()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(numberLabel)
        contentView.addSubview(instructionLabel)
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
    func configure(_ step: Step?) {
        numberLabel.text = "\(step?.number ?? 0)."
        instructionLabel.text = step?.step
    }
    
    // MARK: - Private Methods
    private func setupConstraints() {
        numberLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview().offset(20)
            make.width.equalTo(25)
        }
        
        instructionLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.left.equalTo(numberLabel.snp.right).offset(2)
            make.bottom.equalToSuperview()
            make.right.equalToSuperview().offset(-16)
        }
    }
}
