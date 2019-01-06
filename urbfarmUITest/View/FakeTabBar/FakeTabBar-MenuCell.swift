//
//  FakeTabBar-MenuCell.swift
//  urbfarmUITest
//
//  Created by Andy Jiehan on 06/01/19.
//  Copyright © 2019 Andy Jiehan Aldicho. All rights reserved.
//

import UIKit

class MenuCell: UICollectionViewCell {
    
    let menuIcon: UIImageView = {
        let img = UIImageView()
        return img
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        self.addSubview(menuIcon)
        self.backgroundColor = .lightGray
        setupIconConstraint()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        self.layer.cornerRadius = self.frame.width / 2
    }
    
    func setupIconConstraint() {
        menuIcon.translatesAutoresizingMaskIntoConstraints = false
        menuIcon.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        menuIcon.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
    }
}
