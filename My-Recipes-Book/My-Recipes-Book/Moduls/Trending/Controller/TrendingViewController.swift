//
//  TrendingViewController.swift
//  My-Recipes-Book
//
//  Created by Михаил Болгар on 28.08.2023.
//

import Foundation
import UIKit

class TrendingViewController: UIViewController {
// MARK: - UI element
    private var trendingScreenData: RecipeDataModelForCell?
    private var trandView = TrandingNowView()
    private var networkManager = NetworkManager()

// MARK: - View controller life cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        trandView.transferDelegates(dataSourse: self, delegate: self)
        requestData()
    }

    override func loadView() {
        super.loadView()
        self.view = trandView
    }
    
    private func requestData() {
        networkManager.getAPIData(with: .recentRecipe) { [weak self] (result: RecipeDataModelForCell?, error: String?) in
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
}
// MARK: - UITableViewDataSource
extension TrendingViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trendingScreenData?.results?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TrandRecipeCell.cellID, for: indexPath) as? TrandRecipeCell
        guard let trendingScreenData = trendingScreenData else { return UITableViewCell() }
        cell?.transnferData(recipeData: trendingScreenData.results?[indexPath.row])
        return cell ?? UITableViewCell()
    }
}
// MARK: - UITableViewDelegate
extension TrendingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
