//
//  HomeViewController-CollectionView.swift
//  urbfarmUITest
//
//  Created by Andy Jiehan on 05/01/19.
//  Copyright © 2019 Andy Jiehan Aldicho. All rights reserved.
//

import UIKit

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "roundedCell", for: indexPath) as! RoundedCell
        let colors = [#colorLiteral(red: 0.8563432097, green: 0.4937818646, blue: 0.6653347015, alpha: 1), #colorLiteral(red: 0.5605105162, green: 0.3113227487, blue: 0.7327066064, alpha: 1), #colorLiteral(red: 0.08446101099, green: 0.01631886512, blue: 0.1807191968, alpha: 1)]
//      Don't use layer since it messes up the constraint animation calculation
//        cell.layer.zPosition =  -1 * CGFloat(indexPath.row)
        cell.backgroundColor = colors[indexPath.row % 3]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! RoundedCell
        let cellHeight = cell.frame.height
        let yOffset = ((cellHeight) * CGFloat(indexPath.row)) - ((cellHeight/3) * CGFloat(indexPath.row - 1))
        
//        collectionView.scrollToItem(at: indexPath, at: .top, animated: true)

        self.animateCollectionView(collectionViewYOffset: yOffset)

//        tabBar.alpha = 0
        cell.showBackButton()
        
    }
    
    //TODO: Create object to handle animation
    func animateCollectionView(collectionViewYOffset: CGFloat) {
        collectionViewYConstraint.constant =
            collectionViewYOffset == 0 ? -100 : -collectionViewYOffset
        tabBarYConstraint.constant = -200
        UIView.animate(withDuration: 1) {
            self.view.layoutIfNeeded()
        }
    }
}

struct sectionDataTest {
    var opened   = Bool()
    var title    = ""
    var cellData = [String]()
}

class StackingLayout: UICollectionViewFlowLayout {
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let allAttributes = super.layoutAttributesForElements(in: rect) else {
            return nil
        }
        for attribute in allAttributes {
            attribute.zIndex = attribute.indexPath.row * -1
        }
        return allAttributes
    }

}

class RoundedCell: UICollectionViewCell {
    
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
        setupButtonConstraint()
        
        //Rounded corner
        self.layer.cornerRadius = self.frame.height / 3
        self.layer.maskedCorners = [.layerMaxXMaxYCorner]
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func showBackButton() {
        UIView.animate(withDuration: 1) {
            self.backButton.alpha = 1
        }
    }
    
    func hideBackButton() {
        UIView.animate(withDuration: 1) {
            self.backButton.alpha = 0
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
