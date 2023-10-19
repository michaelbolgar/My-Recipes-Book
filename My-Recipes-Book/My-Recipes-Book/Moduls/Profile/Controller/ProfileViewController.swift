//
//  ProfileViewController.swift
//  My-Recipes-Book
//
//  Created by Михаил Болгар on 02.09.2023.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    //MARK: - Private UI Properties
    private let profileView = ProfileView()
    
    // MARK: - Public Properties
    var myRecipes: [NewRecipe] = []
    
    //MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setConstraints()
        setupNavigationBar()
        profileView.transferDelegates(dataSource: self, delegate: self)
        setupChangeImageButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        profileView.reloadTableView()
    }
    
    // MARK: - Private Actions
    @objc private func rightBarButtonDidTapped() {
        
    }
    
    // MARK: - Public Methods
    func addNewRecipe(_ recipe: NewRecipe) {
        myRecipes.append(recipe)
    }
    
    // MARK: - Private Methods
    private func setupChangeImageButton() {
        profileView.didTapChangeButton = { [weak self] in
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            self?.present(imagePicker, animated: true)
        }
    }
    
    private func setViews() {
        view.addSubview(profileView)
    }
    
    private func setConstraints() {
        profileView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    private func setupNavigationBar() {
        //        navigationController?.navigationBar.prefersLargeTitles = true
        title = "My profile"
        
        let rightBarButton = UIBarButtonItem(
            image: UIImage(systemName: "ellipsis"),
            style: .done,
            target: self,
            action: #selector(rightBarButtonDidTapped)
        )
        
        navigationController?.navigationBar.tintColor = .black
        navigationItem.rightBarButtonItem = rightBarButton
    }
}

// MARK: - UITableViewDataSource
extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        myRecipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(
                withIdentifier: MyRecipeCell.cellID,
                for: indexPath
            )
                as? MyRecipeCell
        else {
            return UITableViewCell()
        }
        
        let recipe = myRecipes[indexPath.row]
        
        cell.configure(
            with: recipe.image,
            recipeName: recipe.name,
            ingrCount: recipe.ingrediets.count,
            cookTime: recipe.cookTime
        )
        cell.selectionStyle = .none
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 225
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let recipe = myRecipes[indexPath.row]
        
        let detailsVC = DetailsViewController(myRecipe: recipe)
        navigationController?.pushViewController(detailsVC, animated: true)
    }
}

// MARK: - UIImagePickerControllerDelegate, UINavigationControllerDelegate
extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.originalImage] as? UIImage {
            profileView.setiProfileImage(selectedImage)
        }
        picker.dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
}
