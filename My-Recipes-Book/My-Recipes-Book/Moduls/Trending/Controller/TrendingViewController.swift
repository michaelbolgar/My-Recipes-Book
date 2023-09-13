//
//  TrendingViewController.swift
//  My-Recipes-Book
//
//  Created by Михаил Болгар on 28.08.2023.
//

/*
 DESCRIPTION
 On the main screen there are category sections that display the first few items.
 When you click on the "See all" button, the user gets to this screen.
 This screen displays the full list of the selected category
 */

import Foundation
import UIKit

class TrendingViewController: UIViewController {
    // MARK: - UI element
    private var trendingScreenData: RecipeDataModelForCell?
    private var trandView = TrandingNowView()
    private var networkManager = NetworkManager()
    //Defines the type of request and the appearance of the cell
    private var sectionType: SectionType
    
    // MARK: - View controller life cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        configureNavigationViewTitle()
        trandView.transferDelegates(dataSourse: self, delegate: self)
        requestData()
        navigationController?.navigationBar.titleTextAttributes = [.font: UIFont.poppins(weight: .semibold, size: 24) as Any]
    }
    
    override func loadView() {
        super.loadView()
        self.view = trandView
    }
    
    init(section type: SectionType) {
        sectionType = type
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - Methods
    private func setViews() {
        //set back button image
        let backBarButtonItem = UIBarButtonItem(image: UIImage(named: "Arrow-Left"), style: .done, target: self, action: #selector(backButtonAction))
        backBarButtonItem.tintColor = UIColor.black
        navigationItem.leftBarButtonItem = backBarButtonItem
    }
    
    @objc private func backButtonAction() {
        navigationController?.popViewController(animated: true)
    }
    
    private func requestData() {
        guard let requestType = checkSectionType() else { return }
        networkManager.getAPIData(with: requestType) { [weak self] (result: RecipeDataModelForCell?, error: String?) in
            DispatchQueue.main.async {
                if let result = result {
                    self?.trendingScreenData = result
                    self?.trandView.reloadTableView()
                }
                if let error = error {
                    print(error)
                }
            }
        }
    }
    //Сhecks the section type passed to the initializer.
    //Depending on this, returns the request type for NetworManager
    private func checkSectionType() -> RecipeAPI? {
        switch self.sectionType {
        case .trending:
            return .trendingNowScreen
        case .recentRecipe:
            return .recentRecipe
        case .popularCreator:
            return .trendingNowScreen
        default:
            print("This section type cannot be used, request is canceled")
            return nil
        }
    }
    
    private func configureNavigationViewTitle() {
        switch sectionType {
        case .trending:
            navigationItem.title = "Trending now"
        case .recentRecipe:
            navigationItem.title = "Recent recipe"
        case.popularCreator:
            navigationItem.title = "Popular creators"
        default:
            print("This section type cannot be used")
        }
    }
}

// MARK: - UITableViewDataSource
extension TrendingViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trendingScreenData?.results?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TrandRecipeCell.cellID, for: indexPath) as? TrandRecipeCell
        guard let trendingScreenData = trendingScreenData else { return UITableViewCell() }
        cell?.transnferData(recipe: trendingScreenData.results?[indexPath.row], section: sectionType, row: indexPath.row)
        return cell ?? UITableViewCell()
    }
}
// MARK: - UITableViewDelegate
extension TrendingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let id = trendingScreenData?.results?[indexPath.row].id else { return }
        guard let navigationController = navigationController else { return }
        navigationController.pushViewController(DetailsViewController(id: id), animated: true)
    }
}
