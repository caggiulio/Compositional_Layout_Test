//
//  HomeView.swift
//  CompositionalLayoutTest
//
//  Created by Nunzio Giulio Caggegi on 05/02/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class HomeView: UIView {
    
    // MARK: - UI properties
    var homeCollectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: .init())
    
    // MARK: - Object lifecycle
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        configureConstraints()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) isn't supported")
    }

    // MARK: - Configure methods
    
    private func configureUI() {
        homeCollectionView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(homeCollectionView)
        
        func makeLayout() -> UICollectionViewLayout {
                let layout = UICollectionViewCompositionalLayout { (section: Int, environment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
                    if section == 0 {
                        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(250)))
                        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
                        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),  heightDimension: .absolute(250))
                        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
                        let section = NSCollectionLayoutSection(group: group)
                        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
                        section.orthogonalScrollingBehavior = .groupPagingCentered
                        
                        return section
                    } else if section == 1 {
                        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(150)))
                        item.contentInsets = NSDirectionalEdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0)
                        let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(150)), subitem: item, count: 1)
                        let section = NSCollectionLayoutSection(group: group)
                        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0.0, bottom: 0.0, trailing: 0.0)
                        section.orthogonalScrollingBehavior = .groupPagingCentered
                        return section
                    } else {
                        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
                        item.contentInsets = NSDirectionalEdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0)
                        let group = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(230)), subitem: item, count: 1)
                        let section = NSCollectionLayoutSection(group: group)
                        section.contentInsets = NSDirectionalEdgeInsets(top: 16.0, leading: 0.0, bottom: 0.0, trailing: 0.0)
                        return section
                    }
                }
                return layout
            }
        
        homeCollectionView.setCollectionViewLayout(makeLayout(), animated: false)
    }

    private func configureConstraints() {
        homeCollectionView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        homeCollectionView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        homeCollectionView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height).isActive = true
        homeCollectionView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
    }

}
