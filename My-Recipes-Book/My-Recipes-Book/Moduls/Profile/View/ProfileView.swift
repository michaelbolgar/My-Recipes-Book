//
//  ProfileView.swift
//  My-Recipes-Book
//
//  Created by Kirill Taraturin on 18.10.2023.
//

import UIKit
import FirebaseAuth
import Firebase

final class ProfileView: UIView {
    
    // MARK: - Private UI Properties
    private lazy var mainImageView: UIView = {
        var imageView = UIView()
        return imageView
    }()
    
    private lazy var profileImageView: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(named: "user")
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    private lazy var userNameLabel: UILabel = {
        var user = UILabel()
        user.text = "Kirill Taraturin"
        user.font = UIFont.poppins(weight: .bold, size: 20)
        return user
    }()
    
    private lazy var recipeLabel: UILabel = {
        var label = UILabel()
        label.text = "My recipes"
        label.font = UIFont.poppins(weight: .semibold, size: 24)
        label.textColor = Palette.neutral100
        return label
    }()
    
    private lazy var mainTableView: UITableView = {
        let tableView = UITableView(frame: self.bounds, style: .grouped)
        tableView.backgroundColor = .systemBackground
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        //        tableView.estimatedRowHeight = 40
        tableView.register(MyRecipeCell.self, forCellReuseIdentifier: MyRecipeCell.cellID)
        return tableView
        
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
        fetchUserData()
        profileImageView.layer.cornerRadius = profileImageView.layer.frame.height / 2
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    func transferDelegates(dataSource: UITableViewDataSource, delegate: UITableViewDelegate) {
        mainTableView.dataSource = dataSource
        mainTableView.delegate = delegate
    }
    
    func reloadTableView() {
        mainTableView.reloadData()
    }
    
    func setupUserNameLabel(_ name: String) {
        userNameLabel.text = name
    }

    // MARK: - Private Methods
    private func setupView() {
        addSubview(mainImageView)
        mainImageView.addSubview(profileImageView)
        addSubview(userNameLabel)
        addSubview(recipeLabel)
        addSubview(mainTableView)
    }

    func fetchUserData() {
            let db = Firestore.firestore()
            if let userId = Auth.auth().currentUser?.uid {
                db.collection("users").document(userId).getDocument { (document, error) in
                    if let document = document, document.exists {
                        if let data = document.data() {
                            let name = data["firstName"] as? String ?? ""
                            let surname = data["lastName"] as? String ?? ""

                            print("Name: \(name), Surname: \(surname)")
                        }
                    } else {
                        print("Document does not exist")
                    }
                }
            }
        }
    
    private func setupConstraints() {
        mainImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.left.equalToSuperview().offset(16)
            make.width.equalTo(85)
            make.height.equalTo(85)
        }
        
        profileImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(0)
            make.left.equalToSuperview().offset(0)
            make.right.equalToSuperview().offset(0)
            make.bottom.equalToSuperview().offset(0)
        }
        
        userNameLabel.snp.makeConstraints { make in
            make.centerY.equalTo(profileImageView.snp.centerY)
            make.left.equalTo(profileImageView.snp.right).offset(40)
        }
        
        recipeLabel.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(48)
            make.left.equalToSuperview().offset(36)
        }
        
        mainTableView.snp.makeConstraints { make in
            make.top.equalTo(recipeLabel.snp.bottom)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}
