//
//  ContainerLayout.swift
//  urbfarmUITest
//
//  Created by Andy Jiehan on 15/01/19.
//  Copyright © 2019 Andy Jiehan Aldicho. All rights reserved.
//

import UIKit

class ContainerLayout: UICollectionViewFlowLayout {
    
    private func addParallaxToAttributes(_ attributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        guard let collectionView = self.collectionView else { return attributes }
        
        let width = collectionView.frame.width
        let centerX = width / 2
        let offset = collectionView.contentOffset.x
        let itemX = attributes.center.x - offset
        let position = (itemX - centerX) / width
        let contentView = collectionView.cellForItem(at: attributes.indexPath)?.contentView
        
        
        if abs(position) >= 1 {
            contentView?.transform = .identity
            
        } else {
            let transitionX = -(width * 0.5 * position)
            contentView?.transform = CGAffineTransform(translationX: transitionX, y: 0)
        }
        
        return attributes
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return super.layoutAttributesForElements(in: rect)?.compactMap { $0.copy() as? UICollectionViewLayoutAttributes }.compactMap(addParallaxToAttributes)
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        //Have no idea what's going on  here 🤷🏿‍♂️
        if (collectionView?.indexPathsForVisibleItems.count)! > 1 {
            return true
        }
        return false
    }
    
//    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
//        guard let containerCollectionView = self.collectionView else {
//            return proposedContentOffset
//        }
//
//        var offsetAdjustment = CGFloat.greatestFiniteMagnitude
//        let horizontalOffset = proposedContentOffset.x
//
//        let targetRect = CGRect(x: proposedContentOffset.x, y: 0, width: containerCollectionView.bounds.size.width, height: containerCollectionView.bounds.size.height)
//
//        let layoutAttributesArray = super.layoutAttributesForElements(in: targetRect)
//
//        let screenCenter = UIScreen.main.bounds.width / 2
//
//        layoutAttributesArray?.forEach({ (layoutAttributes) in
//            let itemOffset = layoutAttributes.frame.origin.x //Position of the cell
//            let itemCenter = layoutAttributes.frame.width / 2
//            let distanceToCenter = itemCenter - screenCenter
//            if fabsf(Float(itemOffset - horizontalOffset)) < fabsf(Float(offsetAdjustment)) {
//                offsetAdjustment = itemOffset - horizontalOffset + distanceToCenter
//            }
//        })
//
//        let adjustedPosition = proposedContentOffset.x + offsetAdjustment
//
//        return CGPoint(x: adjustedPosition, y: proposedContentOffset.y)
//    }
}
