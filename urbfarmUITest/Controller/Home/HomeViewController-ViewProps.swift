//
//  HomeViewController.swift
//  urbfarmUITest
//
//  Created by Andy Jiehan on 05/01/19.
//  Copyright © 2019 Andy Jiehan Aldicho. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    lazy var customCollectionView: UICollectionView = {
//        var colView = UICollectionView()
        let layout = StackingLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = -100
        layout.delegate = self
        
        let colView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        colView.dataSource = self
        colView.delegate = self
        colView.backgroundColor = .clear
        colView.bounces = false
        colView.contentInsetAdjustmentBehavior = .never //Makes collectionview cell fully on top anchor
        
        //Register cell here
        colView.register(RoundedCell.self, forCellWithReuseIdentifier: "roundedCell")
        colView.register(ContentCell.self, forCellWithReuseIdentifier: "contentCell")
        colView.register(BottomContentCell.self, forCellWithReuseIdentifier: "bottomCell")
        
        return colView
    }()
    
    var tabBar: FakeTabBar = {
        let tab = FakeTabBar()
        return tab
    }()
    
    var sectionDataTest = [SectionData]()
    
    //MARK: Constraint reference for animation
    //Should these be props of the collectionview object ?
    
    var collectionViewYConstraint: NSLayoutConstraint!
    var tabBarYConstraint: NSLayoutConstraint!
}
