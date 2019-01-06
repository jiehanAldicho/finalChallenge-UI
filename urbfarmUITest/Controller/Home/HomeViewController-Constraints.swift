//
//  HomeViewController-Constraints.swift
//  urbfarmUITest
//
//  Created by Andy Jiehan on 05/01/19.
//  Copyright © 2019 Andy Jiehan Aldicho. All rights reserved.
//

import UIKit

extension HomeViewController {
    func setupCollectionViewConstraint() {
        customCollectionView.translatesAutoresizingMaskIntoConstraints = false
        customCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        customCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        customCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        customCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
    }
    
    func setupTabBarConstraint() {
        tabBar.translatesAutoresizingMaskIntoConstraints = false
        tabBar.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        tabBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tabBar.heightAnchor.constraint(equalToConstant: tabBar.frame.height).isActive = true
        tabBar.widthAnchor.constraint(equalToConstant: tabBar.frame.width).isActive = true
    }
}
