//
//  TestColorVC.swift
//  urbfarmUITest
//
//  Created by Andy Aldicho on 17/01/19.
//  Copyright © 2019 Andy Jiehan Aldicho. All rights reserved.
//

import UIKit

class TestColorVC: UIViewController {
    lazy var customCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = 0
        
        let colView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        colView.dataSource = self
        colView.delegate = self
        colView.backgroundColor = .clear
        colView.bounces = false
        colView.contentInsetAdjustmentBehavior = .never
        
        //Register cell here
        colView.register(ColorCell.self, forCellWithReuseIdentifier: "colorCell")
        
        return colView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(customCollectionView)
    }
}

extension TestColorVC: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "colorCell", for: indexPath) as! ColorCell
        let color = UIColor(displayP3Red: 200 / 255, green: CGFloat(indexPath.row * 100 / 255), blue: 200 / 255, alpha: 1)
        cell.backgroundColor = color
        return cell
    }
    
    
}

class ColorCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
