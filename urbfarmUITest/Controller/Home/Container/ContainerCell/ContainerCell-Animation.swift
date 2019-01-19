//
//  ContainerCell-Animation.swift
//  urbfarmUITest
//
//  Created by Andy Aldicho on 19/01/19.
//  Copyright © 2019 Andy Jiehan Aldicho. All rights reserved.
//

import UIKit

protocol ContainerCellDDelegate: class {
    func animateTabBarForExpansion()
    func animateTabBarForCollapse()
}

extension ContainerCell {
    func newCollapse() {
        guard let delegate = delegate else {
            print("delegate not found")
            return
        }
        delegate.animateTabBarForCollapse()
    }
    
    func newExpand() {
        guard let delegate = delegate else {
            print("delegate not found")
            return
        }
        delegate.animateTabBarForExpansion()
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

