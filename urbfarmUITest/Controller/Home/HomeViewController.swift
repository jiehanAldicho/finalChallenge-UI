//
//  HomeViewController.swift
//  urbfarmUITest
//
//  Created by Andy Jiehan on 05/01/19.
//  Copyright © 2019 Andy Jiehan Aldicho. All rights reserved.
//

import UIKit

extension HomeViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.6065704226, green: 0.6181306243, blue: 0.7435260415, alpha: 1)
        
        view.addSubview(customCollectionView)
        view.addSubview(tabBar)
        
        setupCollectionViewConstraint()
        setupTabBarConstraint()
    }
    
}
