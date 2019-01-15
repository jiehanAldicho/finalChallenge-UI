//
//  ContainerLayout.swift
//  urbfarmUITest
//
//  Created by Andy Jiehan on 15/01/19.
//  Copyright © 2019 Andy Jiehan Aldicho. All rights reserved.
//

import UIKit

class ContainerLayout: UICollectionViewFlowLayout {
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        guard let containerCollectionView = self.collectionView else {
            return proposedContentOffset
        }
        
        var offsetAdjustment = CGFloat.greatestFiniteMagnitude
        let horizontalOffset = proposedContentOffset.x
        
        let targetRect = CGRect(x: proposedContentOffset.x, y: 0, width: containerCollectionView.bounds.size.width, height: containerCollectionView.bounds.size.height)
        
        let layoutAttributesArray = super.layoutAttributesForElements(in: targetRect)
        
        let screenCenter = UIScreen.main.bounds.width / 2
        
        layoutAttributesArray?.forEach({ (layoutAttributes) in
            let itemOffset = layoutAttributes.frame.origin.x //Position of the cell
            let itemCenter = layoutAttributes.frame.width / 2
            let distanceToCenter = itemCenter - screenCenter
            if fabsf(Float(itemOffset - horizontalOffset)) < fabsf(Float(offsetAdjustment)) {
                offsetAdjustment = itemOffset - horizontalOffset + distanceToCenter
            }
        })
        
        let adjustedPosition = proposedContentOffset.x + offsetAdjustment
        
        return CGPoint(x: adjustedPosition, y: proposedContentOffset.y)
    }
}
