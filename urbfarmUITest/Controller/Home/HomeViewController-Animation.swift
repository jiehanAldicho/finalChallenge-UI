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
//        collectionViewYConstraint.constant = 0
        tabBarYConstraint.constant = 0
        UIView.animate(withDuration: 1) {
            self.view.layoutIfNeeded()
        }
    }
    
    func newExpand() {
//        collectionViewYConstraint.constant = -100
        tabBarYConstraint.constant = -200
        UIView.animate(withDuration: 1) {
            self.view.layoutIfNeeded()
        }
    }
    
    func scrollToTargetCell(to indexPath: IndexPath, yOffset: CGFloat, completion: @escaping () -> ()) {
        UIView.animate(withDuration: 1, animations: {
//            self.customCollectionView.scrollToItem(at: indexPath, at: .top, animated: false)
            let selectedCell = self.customCollectionView.cellForItem(at: indexPath)
            let cellOffset = selectedCell?.frame
            
            print(self.customCollectionView.contentSize, "content size")
            print(cellOffset, "cell frame")
            
            let offset = CGPoint(x: (cellOffset?.minX)!, y: (cellOffset?.minY)! + yOffset)
            self.customCollectionView.setContentOffset(offset, animated: true)
            
            self.view.layoutIfNeeded()
            print(indexPath)
        }) { (true) in
            completion()
        }
        
    }
}
