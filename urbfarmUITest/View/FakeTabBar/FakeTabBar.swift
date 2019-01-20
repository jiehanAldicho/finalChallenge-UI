//
//  FakeTabBar.swift
//  urbfarmUITest
//
//  Created by Andy Jiehan on 06/01/19.
//  Copyright © 2019 Andy Jiehan Aldicho. All rights reserved.
//

import UIKit

extension FakeTabBar {
    
    func setupCollectionViewConstraint()  {
        let collectionWidth =
            (Int(PropsConstant.MenuCell.width.rawValue) * menus.count) +
                (Int(PropsConstant.MenuCollectionView.spacing.rawValue) * (menus.count - 1))
        
        menucCollectionView.translatesAutoresizingMaskIntoConstraints = false
        menucCollectionView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 10).isActive = true
        menucCollectionView.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -10).isActive = true
        menucCollectionView.widthAnchor.constraint(equalToConstant: CGFloat(collectionWidth)).isActive = true
        menucCollectionView.heightAnchor.constraint(equalToConstant: 65).isActive = true
    }
    
    func setupView() {
        self.backgroundColor = .white
        self.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 130)
        
        self.layer.cornerRadius = self.frame.height * 0.6
        self.layer.maskedCorners = [.layerMaxXMaxYCorner]
        self.clipsToBounds = true
    }
}
