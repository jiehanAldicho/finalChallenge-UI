//
//  HomeViewController-ContainerCell.swift
//  urbfarmUITest
//
//  Created by Andy Jiehan on 14/01/19.
//  Copyright © 2019 Andy Jiehan Aldicho. All rights reserved.
//

import UIKit

class ContainerCell: UICollectionViewCell {
    lazy var customCollectionView: UICollectionView = {
        let layout = StackingLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = -100
        layout.delegate = self
        
        let colView = UICollectionView(frame: self.frame, collectionViewLayout: layout)
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
    
//    var sectionDataTest = [SectionData]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(customCollectionView)
        setupData()
        setupCollectionViewContraint()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCollectionViewContraint() {
        customCollectionView.translatesAutoresizingMaskIntoConstraints = false
        customCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        customCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        customCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        
        customCollectionView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
//        collectionViewYConstraint.isActive = true
    }
    
    func setupData() {
        for _ in 1...5 {
            var data = SectionData()
            data.title = "Nasi Goreng"
            data.opened = false
            sectionDataTest.append(data)
        }
    }
    
    func newCollapse() {
//        tabBarYConstraint.constant = 0
//        UIView.animate(withDuration: 0.8, delay: 0, options: .curveEaseInOut, animations: {
//            self.view.layoutIfNeeded()
//        }, completion: nil)
        print("animate tab bar here")
    }
    
    func newExpand() {
//        tabBarYConstraint.constant = -200
//        UIView.animate(withDuration: 1) {
//            self.view.layoutIfNeeded()
//        }
        print("animate tab bar here")
    }
    
    func scrollToTargetCell(to indexPath: IndexPath, yOffset: CGFloat, completion: @escaping () -> ()) {
        
        UIView.animate(withDuration: 0.9, delay: 0, options: .curveEaseInOut, animations: {
            
            let selectedCell = self.customCollectionView.cellForItem(at: indexPath)
            guard let cellOffset = selectedCell?.frame else {
                return
            }
            
            let offset = CGPoint(x: cellOffset.minX, y: cellOffset.minY + yOffset)
            self.customCollectionView.setContentOffset(offset, animated: false)
        }) { (true) in
            completion()
        }
        
    }
}
