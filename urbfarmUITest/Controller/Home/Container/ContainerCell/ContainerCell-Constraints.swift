//
//  ContainerCell-Constraints.swift
//  urbfarmUITest
//
//  Created by Andy Aldicho on 19/01/19.
//  Copyright © 2019 Andy Jiehan Aldicho. All rights reserved.
//

import UIKit

extension ContainerCell {
    func setupCollectionViewContraint() {
        customCollectionView.translatesAutoresizingMaskIntoConstraints = false
        customCollectionView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 0).isActive = true
        customCollectionView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 0).isActive = true
        customCollectionView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: 0).isActive = true
        
        customCollectionView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 0).isActive = true
    }
}
