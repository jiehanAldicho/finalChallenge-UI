//
//  CustomFakeTabBar.swift
//  urbfarmUITest
//
//  Created by Andy Jiehan on 06/01/19.
//  Copyright © 2019 Andy Jiehan Aldicho. All rights reserved.
//

import UIKit

class FakeTabBar: UIView {
    
    lazy var menucCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = 40
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
    
    private func setupCollectionViewConstraint()  {
        menucCollectionView.translatesAutoresizingMaskIntoConstraints = false
        menucCollectionView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        menucCollectionView.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        menucCollectionView.widthAnchor.constraint(equalToConstant: CGFloat(150 + 80)).isActive = true
        menucCollectionView.heightAnchor.constraint(equalToConstant: 65).isActive = true
    }
    
    private func setupView() {
        self.backgroundColor = .white
        self.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 160)
        
        self.layer.cornerRadius = self.frame.height * 0.6
        self.layer.maskedCorners = [.layerMinXMaxYCorner]
        self.clipsToBounds = true
    }
}


