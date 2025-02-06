//
//  HomeView.swift
//  CollectionViewTest
//
//  Created by 안정흠 on 2/5/25.
//

import UIKit

final class HomeView: UIView {
    lazy var collectionView = UICollectionView(frame: .zero,
                                               collectionViewLayout: createCompositionalLayout())
    
}

extension HomeView {
    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { [weak self] section, env in
            self?.firstSection()
        }
        
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.scrollDirection = .vertical
        
        let layout2 = UICollectionViewCompositionalLayout(sectionProvider: { [weak self] section, env in
            self?.firstSection()
        }, configuration: config)
        return layout
    }
    func firstSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize,
                                                     subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        
        
        return section
    }
}
