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
    private var trandView = TrandingNowView()
    private var networkManager = NetworkManager()

// MARK: - View controller life cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        trandView.transferDelegates(dataSourse: self, delegate: self)
    }

    override func loadView() {
        super.loadView()
        self.view = trandView
    }
}
// MARK: - UITableViewDataSource
extension TrendingViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TrandRecipeCell.cellID, for: indexPath) as? TrandRecipeCell
        return cell ?? TrandRecipeCell()
    }
}
// MARK: - UITableViewDelegate
extension TrendingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
