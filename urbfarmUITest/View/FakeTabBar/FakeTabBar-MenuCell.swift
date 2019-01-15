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
        img.tintColor = .lightGray
        img.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
        return img
    }()
    
    lazy var circleBG: UIView = {
        let v = UIView()
        let size = self.frame.width * 0.9
        v.frame = CGRect(x: 0, y: 0, width: size, height: size)
        v.layer.cornerRadius = v.frame.width / 2
        v.backgroundColor = .clear
        
        v.layer.borderColor = UIColor.lightGray.cgColor
        v.layer.borderWidth = 2
        return v
    }()
    
    let menuLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "test"
        lbl.font = UIFont(name: "Avenir-Heavy", size: 11)
        lbl.textColor = .lightGray
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(circleBG)
        self.addSubview(menuIcon)
        self.addSubview(menuLabel)
        
        self.backgroundColor = .clear
        setupIconConstraint()
        setupLabelConstraint()
        
    }
    
    func checkSelected() {
        print(self.isSelected, "is selected")
        if self.isSelected {
            self.circleBG.layer.borderColor = UIColor.darkGray.cgColor
            self.circleBG.layer.borderWidth = 2.5
            self.menuLabel.textColor = .darkGray
            self.menuLabel.font = UIFont(name: "Avenir-Black", size: 11)
            self.menuIcon.tintColor = .darkGray
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupIconConstraint() {
        menuIcon.translatesAutoresizingMaskIntoConstraints = false
        menuIcon.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        menuIcon.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -(self.frame.height * 0.1)).isActive = true
        
        circleBG.translatesAutoresizingMaskIntoConstraints = false
        circleBG.centerXAnchor.constraint(equalTo: menuIcon.centerXAnchor, constant: 0).isActive = true
        circleBG.centerYAnchor.constraint(equalTo: menuIcon.centerYAnchor, constant: 0).isActive = true
        circleBG.widthAnchor.constraint(equalToConstant: circleBG.frame.width).isActive = true
        circleBG.heightAnchor.constraint(equalToConstant: circleBG.frame.height).isActive = true
    }
    
    func setupLabelConstraint()  {
        menuLabel.translatesAutoresizingMaskIntoConstraints = false
        menuLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        menuLabel.topAnchor.constraint(equalTo: menuIcon.bottomAnchor, constant: 12).isActive = true
    }
}
