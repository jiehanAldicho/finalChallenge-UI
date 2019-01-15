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




//Did not use cell layer's z position because it can't be clicked properly
class StackingLayout: UICollectionViewFlowLayout {
    
    //TODO: Fix index bug -> the layoutAttribute function is called twice because there are two animations (scrolling and expanding the section)
    
    weak var delegate: StackingLayoutDelegate?
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        guard let attribute = super.layoutAttributesForItem(at: indexPath) else {
            return nil
        }
        
        //        if attribute.indexPath.row == 0 {
        //            print("Fakyu:", isBeingOpened, sectionDataTest[attribute.indexPath.section].opened)
        //            if (isBeingOpened && sectionDataTest[attribute.indexPath.section].opened){
        //                attribute.zIndex = 0
        //            } else {
        //                attribute.zIndex = attribute.indexPath.section * -1
        //            }
        //        } else {
        //            attribute.zIndex = (attribute.indexPath.row) * -1
        //        }
        
        if (attribute.indexPath.row != 0) {
            attribute.zIndex = (attribute.indexPath.row) * -1 - sectionDataTest.count
        }
        
        return attribute
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let allAttributes = super.layoutAttributesForElements(in: rect) else {
            return nil
        }
        
        //        for attribute in allAttributes {
        //            if !(isBeingOpened) && attribute.indexPath.row == 0 {
        //                attribute.zIndex = attribute.indexPath.section * -1
        //            }
        //        }
        
        for attribute in allAttributes {
            //            print("Attribute in section \(attribute.indexPath.section), row: \(attribute.indexPath.row) with zIndex: \(attribute.zIndex)")
            //            if attribute.indexPath.row == 0 {
            //                if (isBeingOpened && sectionDataTest[attribute.indexPath.section].opened){
            ////                    attribute.zIndex = 0
            ////                    print("Attribute in section \(attribute.indexPath.section), row: \(attribute.indexPath.row) with zIndex: \(attribute.zIndex)")
            //                    isBeingOpened = false
            //                } else {
            ////                    attribute.zIndex = attribute.indexPath.section * -1
            //                }
            //            }
            
            attribute.zIndex = attribute.indexPath.section * -1
            //            } else {
            //                attribute.zIndex = (attribute.indexPath.row) * -1
            //            }
            //            print("section: \(attribute.indexPath.section), row: \(attribute.indexPath.row), index: \(attribute.zIndex)")
            //            print("isBeingOpened \(isBeingOpened)")
        }
        
        return allAttributes
    }
    
    override func finalLayoutAttributesForDisappearingItem(at itemIndexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        guard let attribute = super.finalLayoutAttributesForDisappearingItem(at: itemIndexPath) else {
            return nil
        }
        //        print("dissapearing cell -> section: \(itemIndexPath.section), row \(itemIndexPath.row) zindex \(attribute.zIndex)")
        return attribute
    }
    
    
    
    override func prepare() {
        //        print("prepare called")
    }
    
    override func initialLayoutAttributesForAppearingItem(at itemIndexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        guard let attribute = super.initialLayoutAttributesForAppearingItem(at: itemIndexPath) else {
            return nil
        }
        
        //Delay buffer for tabBar swiping
        // TODO: Only call this when tab-bar swipes
        //        let section = attribute.indexPath.section
        //        let xOffset = CGFloat(100 * section)
        //
        //        let frm = attribute.frame
        //        attribute.frame = CGRect(x: frm.minX + xOffset , y: frm.minY, width: frm.width, height: frm.height)
        //
        return attribute
    }
}

