//
//  EditProfileViewController.swift
//  My-Recipes-Book
//
//  Created by Kirill Taraturin on 20.10.2023.
//

import UIKit

final class EditProfileViewController: UIViewController {
    
    // MARK: - Private UI Properties
    private let editProfileView = EditProfileView()
    private let scrollView = UIScrollView()
    private let imagePicker = UIImagePickerController()
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setupConstraints()
        view.backgroundColor = .white
        title = "Edit Profile"
        setupChangeImageButton()
        setupNavigationBar()
    }
    
    
    // MARK: - Private Actions
    @objc private func saveButtonDidTapped() {
        showAlert()
    }
    
    // MARK: - Private Methods
    private func setupChangeImageButton() {
        // добавлена возможность выбрать источник данные, галерея или камера телефона
        editProfileView.didTapChangeButton = { [weak self] in
            let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "Camera", style: .default) { _ in
                self?.imagePicker.sourceType = .camera
                self?.imagePicker.delegate = self
                self?.present(self?.imagePicker ?? UIImagePickerController(), animated: true)
                
            })
            alert.addAction(UIAlertAction(title: "Photo Library", style: .default) { _ in
                self?.imagePicker.sourceType = .photoLibrary
                self?.imagePicker.delegate = self
                self?.present(self?.imagePicker ?? UIImagePickerController(), animated: true)
            })
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
            self?.present(alert, animated: true)
        }
    }
    
    private func setViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(editProfileView)
    }
    
    private func setupConstraints() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        editProfileView.snp.makeConstraints { make in
            make.top.equalTo(scrollView)
            make.bottom.equalTo(scrollView)
            make.left.right.equalTo(view)
            make.width.equalTo(view)
            make.height.equalTo(700)  // явно заданная высота
        }
    }
    
    private func setupNavigationBar() {
        let saveBarButton = UIBarButtonItem(
            barButtonSystemItem: .save,
            target: self,
            action: #selector(saveButtonDidTapped)
        )
        
        navigationController?.navigationBar.tintColor = Palette.redPrimary50
        navigationItem.rightBarButtonItem = saveBarButton
    }
    
    private func showAlert() {
        let alert = UIAlertController(
            title: "You changes were successfully saved",
            message: "",
            preferredStyle: .alert
        )
        
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okAction)
        
        present(alert, animated: true)
    }
}

// MARK: - UIImagePickerControllerDelegate, UINavigationControllerDelegate
extension EditProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.originalImage] as? UIImage {
            editProfileView.setProfileImage(selectedImage)
        }
        picker.dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
}
