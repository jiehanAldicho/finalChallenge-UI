//
//  CustomFakeTabBar.swift
//  urbfarmUITest
//
//  Created by Andy Jiehan on 06/01/19.
//  Copyright © 2019 Andy Jiehan Aldicho. All rights reserved.
//

import UIKit

class FakeTabBar: UIView {
    
    enum PropsConstant {
        enum MenuCell: CGFloat {
            case width = 50
            case height = 65
        }
        enum MenuCollectionView: CGFloat {
            case spacing = 65
        }
    }
    
    lazy var menucCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = PropsConstant.MenuCollectionView.spacing.rawValue
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        
        let colView = UICollectionView(frame: self.frame, collectionViewLayout: layout)
        colView.dataSource = self
        colView.delegate = self
        colView.backgroundColor = .clear
        colView.isScrollEnabled = true
        colView.bounces = true
        
        colView.register(MenuCell.self, forCellWithReuseIdentifier: "menuCell")
        
        
        return colView
    }()
    
    var menus = ["Home", "Profile", "Plants"]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        self.addSubview(menucCollectionView)
        setupCollectionViewConstraint()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}


