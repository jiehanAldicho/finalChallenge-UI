//
//  StackingLayout.swift
//  urbfarmUITest
//
//  Created by Andy Jiehan on 15/01/19.
//  Copyright © 2019 Andy Jiehan Aldicho. All rights reserved.
//

import UIKit

//Delegate to retrieve section data
protocol StackingLayoutDelegate: class {
    func isSectionOpened(at: Int) -> (Bool, Int)
}

class StackingLayout: UICollectionViewFlowLayout {
    
    weak var delegate: StackingLayoutDelegate?
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        //This func is only called when there's insertion or deletion in the collection view
        guard let attribute = super.layoutAttributesForItem(at: indexPath) else {
            return nil
        }
        
        if (attribute.indexPath.row != 0) {
            attribute.zIndex = (attribute.indexPath.row) * -1 - (collectionView?.numberOfSections)!
        } else {
            attribute.zIndex = attribute.indexPath.section * -1
        }
        
        return attribute
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let allAttributes = super.layoutAttributesForElements(in: rect) else {
            return nil
        }
        
        for attribute in allAttributes {
            attribute.zIndex = attribute.indexPath.section * -1
        }
        
        return allAttributes
    }
    
    override func initialLayoutAttributesForAppearingItem(at itemIndexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        guard let attribute = super.initialLayoutAttributesForAppearingItem(at: itemIndexPath) else {
            return nil
        }
        
        //Delay buffer for tabBar swiping
        // TODO: Only call this when tab-bar swipes
//                let section = attribute.indexPath.section
//                let xOffset = CGFloat(100 * section)
//
//                let frm = attribute.frame
//                attribute.frame = CGRect(x: frm.minX + xOffset , y: frm.minY, width: frm.width, height: frm.height)
        //
        return attribute
    }
}

