//
//  HomeViewController-ContainerCell.swift
//  urbfarmUITest
//
//  Created by Andy Jiehan on 14/01/19.
//  Copyright © 2019 Andy Jiehan Aldicho. All rights reserved.
//

import UIKit

protocol ContainerCellDelegate: class {
    func animateTabBarForExpansion()
    func animateTabBarForCollapse()
}

class ContainerCell: UICollectionViewCell {
    struct AppearingCell {
        var top: UICollectionViewCell?
        var middle: UICollectionViewCell?
        var bottom: UICollectionViewCell?
    }
    
    var num: Int?
    
    weak var delegate: ContainerCellDelegate?
    
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
        colView.register(HeaderCell.self, forCellWithReuseIdentifier: "headerCell")
        colView.register(ContentCell.self, forCellWithReuseIdentifier: "contentCell")
        colView.register(BottomContentCell.self, forCellWithReuseIdentifier: "bottomCell")
        
        return colView
    }()
    
    var sectionDataTest = [SectionData]()
    
    var currentVisibleCells = AppearingCell()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(customCollectionView)
        setupData()
        setupCollectionViewContraint()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupData() {
        for _ in 1...10 {
            var data = SectionData()
            data.title = "Menanam Bibit Kebencian"
            data.opened = false
            sectionDataTest.append(data)
        }
    }
    
    
}
