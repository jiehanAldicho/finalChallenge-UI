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
        
        view.addSubview(containerCollectionView)
        view.addSubview(tabBar)
        
        setupContainerCollectionViewConstraint()
        setupTabBarConstraint()
        
        setupData()
        
        containerCollectionView.scrollToItem(at: IndexPath(row: 1, section: 0), at: .centeredHorizontally, animated: false)
    }
    
    func setupData() {
        for _ in 0...10 {
            var data = SectionData()
            data.title = "Nasi Goreng"
            data.opened = false
            sectionDataTest.append(data)
        }
    }
    
}

extension HomeViewController: FakeTabBarDelegate {
    func selectedMenuAt(indexPath: IndexPath) {
        containerCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    
}
