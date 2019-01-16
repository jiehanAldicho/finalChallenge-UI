//
//  HomeViewController-Constraints.swift
//  urbfarmUITest
//
//  Created by Andy Jiehan on 05/01/19.
//  Copyright © 2019 Andy Jiehan Aldicho. All rights reserved.
//

import UIKit

extension HomeViewController {
    func setupContainerCollectionViewConstraint() {
        containerCollectionView.translatesAutoresizingMaskIntoConstraints = false
        containerCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        containerCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        containerCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        containerCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
    
    func setupTabBarConstraint() {
        tabBar.translatesAutoresizingMaskIntoConstraints = false
        tabBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tabBar.heightAnchor.constraint(equalToConstant: tabBar.frame.height).isActive = true
        tabBar.widthAnchor.constraint(equalToConstant: tabBar.frame.width).isActive = true
        
        tabBarYConstraint = tabBar.topAnchor.constraint(equalTo: view.topAnchor, constant: 0)
        tabBarYConstraint.isActive = true
        
//        tabBarYConstraint = tabBar.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
//        tabBarYConstraint.isActive = true
    }

}
