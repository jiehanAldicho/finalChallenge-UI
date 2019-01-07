//
//  File.swift
//  urbfarmUITest
//
//  Created by Andy Jiehan on 08/01/19.
//  Copyright © 2019 Andy Jiehan Aldicho. All rights reserved.
//

import UIKit

protocol RoundedCellDelegate: class {
    func backButtonPressed(onCell cell: RoundedCell)
}

class RoundedCell: UICollectionViewCell {
    
    weak var delegate: RoundedCellDelegate?
    
    let backButton: UIButton = {
        let img = UIImage(named: "Back")?.withRenderingMode(.alwaysTemplate)
        let btn = UIButton()
        btn.setImage(img, for: .normal)
        btn.tintColor = .white
        btn.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        btn.alpha = 0
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(backButton)
        backButton.addTarget(self, action: #selector(handleBackButtonPressed), for: .touchUpInside)
        setupButtonConstraint()
        
        //Rounded corner
        self.layer.cornerRadius = self.frame.height / 3
        self.layer.maskedCorners = [.layerMaxXMaxYCorner]
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func handleBackButtonPressed() {
        delegate?.backButtonPressed(onCell: self)
        UIView.animate(withDuration: 1) {
            self.backButton.alpha = 0
        }
    }
    
    func showBackButton() {
        UIView.animate(withDuration: 1) {
            self.backButton.alpha = 1
        }
    }
    
    
    func setupButtonConstraint() {
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 150).isActive = true
        backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: backButton.frame.width).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: backButton.frame.height).isActive = true
    }
    
}
