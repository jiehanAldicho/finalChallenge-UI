//
//  HomeViewController.swift
//  urbfarmUITest
//
//  Created by Andy Jiehan on 05/01/19.
//  Copyright © 2019 Andy Jiehan Aldicho. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    lazy var containerCollectionView: UICollectionView = {
        let layout = ContainerLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.scrollDirection = .horizontal
        
        let colView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        colView.dataSource = self
        colView.delegate = self
        colView.backgroundColor = .clear
        colView.contentInsetAdjustmentBehavior = .never
//        colView.decelerationRate = UIScrollView.DecelerationRate.fast
        colView.isPagingEnabled = true
        
        colView.register(ContainerCell.self, forCellWithReuseIdentifier: "containerCell")
        
        return colView
    }()
    
    lazy var tabBar: FakeTabBar = {
        let tab = FakeTabBar()
        tab.delegate = self
        return tab
    }()
    
//    var sectionDataTest = [SectionData]()
    
    //MARK: Constraint reference for animation
    //Should these be props of the collectionview object ?
    
    var collectionViewYConstraint: NSLayoutConstraint!
    var tabBarYConstraint: NSLayoutConstraint!
}
