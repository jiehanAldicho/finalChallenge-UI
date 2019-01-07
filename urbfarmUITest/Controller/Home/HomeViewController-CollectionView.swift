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
        
        cell.backgroundColor = colors[indexPath.row % 3]
        cell.delegate = self
        
//      Don't use layer since it messes up the constraint animation calculation
//        cell.layer.zPosition =  -1 * CGFloat(indexPath.row)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! RoundedCell
        let cellHeight = cell.frame.height
        let yOffset = ((cellHeight) * CGFloat(indexPath.row)) - ((cellHeight/3) * CGFloat(indexPath.row - 1))
        
        //TODO: Scroll the collection view first and then animate it
//        collectionView.scrollToItem(at: indexPath, at: .top, animated: true)

        self.expandCell(collectionViewYOffset: yOffset)

        cell.showBackButton()
        
    }
    
    //TODO: Create object to handle animation
    func expandCell(collectionViewYOffset: CGFloat) {
        collectionViewYConstraint.constant =
            collectionViewYOffset == 0 ? -100 : -collectionViewYOffset
        tabBarYConstraint.constant = -200
        UIView.animate(withDuration: 1) {
            self.view.layoutIfNeeded()
        }
    }
    
    func returnCell() {
        collectionViewYConstraint.constant = 0
        tabBarYConstraint.constant = 0
        UIView.animate(withDuration: 1) {
//            self.view.setNeedsLayout()
            self.view.layoutIfNeeded()
        }
    }
}

extension HomeViewController: RoundedCellDelegate {
    func backButtonPressed(onCell: RoundedCell)  {
        returnCell()
    }
}


//Did not use cell layer's z position because it can't be clicked properly
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


