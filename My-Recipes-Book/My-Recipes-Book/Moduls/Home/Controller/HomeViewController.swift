//
//  HomeViewController.swift
//  My-Recipes-Book
//
//  Created by Михаил Болгар on 28.08.2023.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    //MARK: - Propperties
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.createCompositionalLayout() )
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .yellow
        return collectionView
    }()
    
    //    private lazy var homeView = {
    //        HomeView(frame: view.bounds)
    //    }()
    //MARK: - Load view
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        title = "Get amazing recepies for cooking"
        //view.addSubview(homeView)
        
    }
    
    //MARK: - Methods
    private func setOutlets() {
        view.addSubview(collectionView)
        collectionView.register(TrendingCollectionViewCell.self, forCellWithReuseIdentifier: TrendingCollectionViewCell.reuseID)
        collectionView.register(PopularCategoryCollectionViewCell.self, forCellWithReuseIdentifier: PopularCategoryCollectionViewCell.reuseID)
        collectionView.register(PopularItemCollectionViewCell.self, forCellWithReuseIdentifier: PopularItemCollectionViewCell.reuseID)
        collectionView.register(RecentCollectionViewCell.self, forCellWithReuseIdentifier: RecentCollectionViewCell.reuseID)
        collectionView.register(PopularCreatorCollectionViewCell.self, forCellWithReuseIdentifier: PopularCreatorCollectionViewCell.reuseID)
    }
    
    private func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        
        
    }
    
}


//MARK: - UICollectionViewDelegate

extension HomeViewController: UICollectionViewDelegate {
    
}

//MARK: - UICollectionViewDataSource

extension HomeViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        SectionType.allCases.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case SectionType.trending.rawValue:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TrendingCollectionViewCell.reuseID, for: indexPath)
            return cell
        case SectionType.popularCategory.rawValue:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularCategoryCollectionViewCell.reuseID, for: indexPath)
            return cell
        case SectionType.popularItem.rawValue:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularItemCollectionViewCell.reuseID, for: indexPath)
            return cell
        case SectionType.popularCreator.rawValue:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularCreatorCollectionViewCell.reuseID, for: indexPath)
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    
}
