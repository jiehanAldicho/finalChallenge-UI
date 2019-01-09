//
//  HomeViewController-Animation.swift
//  urbfarmUITest
//
//  Created by Andy Jiehan on 08/01/19.
//  Copyright © 2019 Andy Jiehan Aldicho. All rights reserved.
//

import UIKit

extension HomeViewController {
    //TODO: Create object to handle animation
    func expandCell(collectionViewYOffset: CGFloat) {
        collectionViewYConstraint.constant =
            collectionViewYOffset == 0 ? -100 : -collectionViewYOffset
        tabBarYConstraint.constant = -200
        UIView.animate(withDuration: 1) {
            self.view.layoutIfNeeded()
        }
    }
    
    func collapseCell() {
        collectionViewYConstraint.constant = 0
        tabBarYConstraint.constant = 0
        UIView.animate(withDuration: 1) {
            self.view.layoutIfNeeded()
        }
    }
    
    func newCollapse() {
        tabBarYConstraint.constant = 0
        UIView.animate(withDuration: 1) {
            self.view.layoutIfNeeded()
        }
    }
    
    func newExpand() {
        tabBarYConstraint.constant = -200
        UIView.animate(withDuration: 1) {
            self.view.layoutIfNeeded()
        }
    }
    
    func scrollToTargetCell(to indexPath: IndexPath, yOffset: CGFloat, completion: @escaping () -> ()) {
//        UIView.animate(withDuration: 1, animations: {
//            let selectedCell = self.customCollectionView.cellForItem(at: indexPath)
//            guard let cellOffset = selectedCell?.frame else {
//                return
//            }
//            
//            let offset = CGPoint(x: cellOffset.minX, y: cellOffset.minY + yOffset)
//            self.customCollectionView.setContentOffset(offset, animated: true)
//            
//            self.view.layoutIfNeeded()
//        }) { (true) in
//            completion()
//        }
        
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseInOut, animations: {
            
            let selectedCell = self.customCollectionView.cellForItem(at: indexPath)
            guard let cellOffset = selectedCell?.frame else {
                return
            }
            
            let offset = CGPoint(x: cellOffset.minX, y: cellOffset.minY + yOffset)
            

            self.customCollectionView.setContentOffset(offset, animated: false)
            
            
//            self.view.layoutIfNeeded()
        }) { (true) in
            completion()
        }
        
    }
}
