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
        setOutlets()
        setupConstraints()
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
    //MARK: - Compositional layout creation
    
    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        
        let layout = UICollectionViewCompositionalLayout { sectionNumber, layoutEnviroment in
            switch sectionNumber {
            case SectionType.trending.rawValue:
                return self.createTrendingSection()
            case SectionType.popularCategory.rawValue:
                return self.createPopularCategorySection()
            case SectionType.popularItem.rawValue:
                return self.createPopularItemSection()
            case SectionType.recentRecipe.rawValue:
                return self.createRecentRecipeSection()
            case SectionType.popularCreator.rawValue:
                return self.createPopularCreatorSection()
            default: return nil
            }
        }
        return layout
    }
    
    private func createTrendingSection() -> NSCollectionLayoutSection {
        //item
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalWidth(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        
        //group
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1/3),
            heightDimension: .fractionalWidth(1/3))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        //section
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 0)
        return section
    }
    
    private func createPopularCategorySection() -> NSCollectionLayoutSection {
        //item
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalWidth(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        
        //group
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1/3),
            heightDimension: .fractionalWidth(1/3))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        //section
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 0)
        return section
    }
    
    private func createPopularItemSection() -> NSCollectionLayoutSection {
        //item
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalWidth(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        
        //group
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1/3),
            heightDimension: .fractionalWidth(1/3))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        //section
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 0)
        return section
    }
    
    private func createRecentRecipeSection() -> NSCollectionLayoutSection {
        //item
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalWidth(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        
        //group
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1/3),
            heightDimension: .fractionalWidth(1/3))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        //section
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 0)
        return section
    }
    
    private func createPopularCreatorSection() -> NSCollectionLayoutSection {
        //item
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalWidth(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        
        //group
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1/3),
            heightDimension: .fractionalWidth(1/3))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        //section
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 0)
        return section
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
        10
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
        case SectionType.recentRecipe.rawValue:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecentCollectionViewCell.reuseID, for: indexPath)
            return cell
        case SectionType.popularCreator.rawValue:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularCreatorCollectionViewCell.reuseID, for: indexPath)
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    
}
