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
        self.backgroundColor = .white
        setupData()
        setupCollectionViewContraint()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupData() {
        var guide1 = Guide()
        guide1.author = "Hubert"
        guide1.description = "This is a guide to plant Basil on a limited spaces in your apartment. It’s easy to grow this plant because you don’t need to have a lot of control of this plant. All you need is just to water it on a daily basis. It will takes about 40 days to grow this plant. I have already have a plenty of basils on my house using this guide."
        guide1.difficulty = .easy
        guide1.title = "Menanam Bibit Kebencian"
        guide1.duration = 10
        guide1.plantType = "Basil"
        guide1.plantImage = UIImage(named: "gambarTest1")
        
        var guide2 = Guide()
        guide2.author = "Hubert"
        guide2.description = "Basil is most commonly used fresh in recipes. In general, it is added at the last moment, as cooking quickly destroys the flavor. The fresh herb can be kept for a short time in plastic bags in the refrigerator, or for a longer period in the freezer, after being blanched quickly in boiling water."
        guide2.difficulty = .easy
        guide2.title = "Basil 101"
        guide2.duration = 10
        guide2.plantType = "Water Spinach"
        guide2.plantImage = UIImage(named: "gambarTest2")
        
        var guide3 = Guide()
        guide3.author = "Hubert"
        guide3.description = "The fresh herb can be kept for a short time in plastic bags in the refrigerator, or for a longer period in the freezer, after being blanched quickly in boiling water. The dried herb also loses most of its flavor, and what little flavor remains tastes very different, with a weak coumarin flavor, like hay."
        guide3.difficulty = .easy
        guide3.title = "Menanam Benih Cinta"
        guide3.duration = 10
        guide3.plantType = "Chili"
        guide3.plantImage = UIImage(named: "gambarTest3")
        
        var guide4 = Guide()
        guide4.author = "Hubert"
        guide4.description = "This is a guide to plant Basil on a limited spaces in your apartment. It’s easy to grow this plant because you don’t need to have a lot of control of this plant. All you need is just to water it on a daily basis. It will takes about 40 days to grow this plant. I have already have a plenty of basils on my house using this guide."
        guide4.difficulty = .easy
        guide4.title = "Planting Chili at Home"
        guide4.duration = 10
        guide4.plantType = "Oregano"
        guide4.plantImage = UIImage(named: "gambarTest4")
        
        
        self.sectionDataTest = [
            SectionData(opened: false, guide: guide1, cellData: [String]()),
            SectionData(opened: false, guide: guide2, cellData: [String]()),
            SectionData(opened: false, guide: guide3, cellData: [String]()),
            SectionData(opened: false, guide: guide4, cellData: [String]()),
            SectionData(opened: false, guide: guide1, cellData: [String]()),
            SectionData(opened: false, guide: guide3, cellData: [String]()),
            SectionData(opened: false, guide: guide2, cellData: [String]())
        ]
    }
    
    
}
