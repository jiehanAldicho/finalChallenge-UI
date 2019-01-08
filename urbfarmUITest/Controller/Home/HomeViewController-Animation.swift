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
    
    func scrollToTargetCell(to indexPath: IndexPath, completion: @escaping () -> ()) {
        UIView.animate(withDuration: 1, animations: {
            //            self.customCollectionView.scrollToItem(at: indexPath, at: .top, animated: false)
            self.view.layoutIfNeeded()
            self.customCollectionView.setContentOffset(CGPoint(x: 0, y: 1000), animated: false)
            print(indexPath)
        }) { (true) in
            completion()
        }
        
    }
}
