//
//  HomeViewController-CollectionView.swift
//  urbfarmUITest
//
//  Created by Andy Jiehan on 05/01/19.
//  Copyright © 2019 Andy Jiehan Aldicho. All rights reserved.
//

import UIKit

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "containerCell", for: indexPath) as! ContainerCell
        cell.delegate = self
        cell.num = indexPath.row
        cell.clipsToBounds = true
        return cell

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let selectedIndex = containerCollectionView.indexPathsForVisibleItems[0]
        self.tabBar.menucCollectionView.selectItem(at: selectedIndex, animated: true, scrollPosition: [])
        
    }
    
}

extension HomeViewController: ContainerCellDelegate {
    func animateTabBarForExpansion() {
        tabBarYConstraint.constant = -200
        UIView.animate(withDuration: 0.8, delay: 0, options: .curveEaseInOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
        containerCollectionView.isScrollEnabled = false
    }
    
    func animateTabBarForCollapse() {
        tabBarYConstraint.constant = 0
        UIView.animate(withDuration: 1) {
            self.view.layoutIfNeeded()
        }
        containerCollectionView.isScrollEnabled = true
    }
}
