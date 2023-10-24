//
//  ProfileViewController.swift
//  My-Recipes-Book
//
//  Created by Михаил Болгар on 02.09.2023.
//

import UIKit
import Firebase
import FirebaseFirestore



final class ProfileViewController: UIViewController{
    
    // MARK: - Private UI Properties
    private let profileView = ProfileView()
    
    // MARK: - Private Properties
    private let rowHeight: CGFloat = 225
    
    // MARK: - User Info
    private var name: String?
    private var surname: String?
    private var email: String?
    
    // MARK: - Public Properties
    var myRecipes: [NewRecipe] = []
    var isMyRecipeEmpty = false
    
    //MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setConstraints()
        setupNavigationBar()
        profileView.transferDelegates(dataSource: self, delegate: self)
        // вызываем метод для установки имени пользователя в label
        fetchUserData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        isMyRecipeEmpty = myRecipes.isEmpty
        profileView.reloadTableView()
    }
    
    // MARK: - Private Actions
    // This method is triggered when the options button is tapped
    @objc private func optionsButtonDidTapped(sender: UIBarButtonItem) {
        let popoverContent = CustomPopoverViewController()
        popoverContent.modalPresentationStyle = .popover
        if let popover = popoverContent.popoverPresentationController {
            popover.barButtonItem = sender
            popover.permittedArrowDirections = []
            popover.delegate = self
            
            popoverContent.preferredContentSize = CGSize(width: 200, height: 80)
            popoverContent.delegate = self
            present(popoverContent, animated: true)
        }
    }
    
    // MARK: - Public Methods
    func addNewRecipe(_ recipe: NewRecipe) {
        myRecipes.append(recipe)
        isMyRecipeEmpty = false
    }
    
    // MARK: - Private Methods
    func fetchUserData() {
        let db = Firestore.firestore()
        if let userId = Auth.auth().currentUser?.uid {
            db.collection("users").document(userId).getDocument { (document, error) in
                if let document = document, document.exists {
                    if let data = document.data() {
                        let name = data["firstName"] as? String ?? ""
                        let surname = data["lastName"] as? String ?? ""
                        let email = data["email"] as? String ?? ""
                        
                        // устанавливаем имя пользователя в label
                        self.profileView.setupUserNameLabel("\(name) \(surname)")
                        
                        /*
                         передаем данные пользователя в свойства, которые потом
                         передаем в иницианилизатор при переходе
                         */
                        self.name = name
                        self.surname = surname
                        self.email = email
                
                    }
                } else {
                    print("Document does not exist")
                }
            }
        }
    }
    
    // MARK: - Setup UI Methods
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
        title = "My profile"
        
        let optionsButton = UIBarButtonItem(
            image: UIImage(systemName: "ellipsis"),
            style: .done,
            target: self,
            action: #selector(optionsButtonDidTapped)
        )
        
        navigationController?.navigationBar.tintColor = .black
        navigationItem.rightBarButtonItem = optionsButton
    }
}

// MARK: - UITableViewDataSource
extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        isMyRecipeEmpty ? 1 : myRecipes.count
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
        
        if !isMyRecipeEmpty {
            let recipe = myRecipes[indexPath.row]
            cell.configure(
                with: recipe.image,
                recipeName: recipe.name,
                ingrCount: recipe.ingrediets.count,
                cookTime: recipe.cookTime
            )
        } else {
            cell.configureWithoutRecipe()
        }
        
        cell.selectionStyle = .none
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        rowHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if !isMyRecipeEmpty {
            let recipe = myRecipes[indexPath.row]
            
            let detailsVC = DetailsViewController(myRecipe: recipe)
            navigationController?.pushViewController(detailsVC, animated: true)
        } else {
            let createVC = NewRecipeViewController()
            //            navigationController?.pushViewController(createVC, animated: true)
            //            createVC.modalPresentationStyle = .fullScreen
            present(createVC, animated: true)
            //            self.tabBarController?.selectedIndex = 2
        }
    }
}

// MARK: - UIPopoverPresentationControllerDelegate
extension ProfileViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        .none
    }
}

// MARK: - CustomPopoverDelegate
extension ProfileViewController: CustomPopoverDelegate {
    func didTapEditProfile() {
        self.dismiss(animated: true) {
            let editProfileVC = EditProfileViewController(
                name: self.name ?? "",
                surname: self.surname ?? "",
                email: self.email ?? ""
            )
          
            self.navigationController?.pushViewController(editProfileVC, animated: true)
        }
    }
}
