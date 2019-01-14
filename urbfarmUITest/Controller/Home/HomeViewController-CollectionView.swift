//
//  HomeViewController-CollectionView.swift
//  urbfarmUITest
//
//  Created by Andy Jiehan on 05/01/19.
//  Copyright © 2019 Andy Jiehan Aldicho. All rights reserved.
//

import UIKit

struct SectionData {
    var opened = Bool()
    var title = ""
    var cellData = [String]()
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        if collectionView == containerCollectionView {
//            return 2
//        } else {
//            return sectionDataTest.count
//        }
//
//    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == containerCollectionView {
            return 3
        } else {
            return 1
        }
//        if sectionDataTest[section].opened == true {
//            return sectionDataTest[section].cellData.count + 1
//        } else {
//            return 1
//        }
    }
    
    //Line spacing for section
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        if section != 0 {
//            if sectionDataTest[section - 1].opened == true {
//                return UIEdgeInsets(top: 100, left: 0, bottom: -100, right: 0)
//
//            }
//        }
//
//        return UIEdgeInsets(top: 0, left: 0, bottom: -100, right: 0)
//    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "containerCell", for: indexPath) as! ContainerCell
        let rowFloat = CGFloat(indexPath.row)
        cell.backgroundColor = UIColor(displayP3Red: rowFloat * 0.3, green: rowFloat * 0.3, blue: rowFloat * 0.3, alpha: 1)
        return cell
        
//        if indexPath.row == 0 {
//            let header = collectionView.dequeueReusableCell(withReuseIdentifier: "roundedCell", for: indexPath) as! RoundedCell
//            let colors = [#colorLiteral(red: 0.8563432097, green: 0.4937818646, blue: 0.6653347015, alpha: 1), #colorLiteral(red: 0.5605105162, green: 0.3113227487, blue: 0.7327066064, alpha: 1), #colorLiteral(red: 0.08446101099, green: 0.01631886512, blue: 0.1807191968, alpha: 1)]
//
//            header.backgroundColor = colors[indexPath.section % 3]
//            header.cellTitleLabel.text = sectionDataTest[indexPath.section].title
//            header.delegate = self
//
//            return header
//        } else if indexPath.row == 1{
//            let contentCell = collectionView.dequeueReusableCell(withReuseIdentifier: "contentCell", for: indexPath) as! ContentCell
//            return contentCell
//        } else {
//            let bottomCell = collectionView.dequeueReusableCell(withReuseIdentifier: "bottomCell", for: indexPath) as! BottomContentCell
//            return bottomCell
//        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        var cellHeight: CGFloat = 300
//        if indexPath.row == 1 {
//            cellHeight = 250
//        } else if indexPath.row == 2 {
//            cellHeight = 565 //TODO: Calculate the remaining empty space
//        }
//        return CGSize(width: view.frame.width, height: cellHeight)
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let cell = collectionView.cellForItem(at: indexPath) as! RoundedCell
//
//        isBeingOpened = !sectionDataTest[indexPath.section].opened
//        if indexPath.row == 0 {
//            if sectionDataTest[indexPath.section].opened == false {
//
//                sectionDataTest[indexPath.section].opened = true
//
//                self.scrollToTargetCell(to: indexPath, yOffset: 100, completion: {
//
//
//                })
//                cell.showBackButton()
//
//                //TODO: Refactor these shits
//                self.sectionDataTest[indexPath.section].cellData.append("bannamna")
//                self.sectionDataTest[indexPath.section].cellData.append("new shits")
//
//                var indices = [IndexPath]()
//
//                for i in 1 ... self.sectionDataTest[indexPath.section].cellData.count {
//                    let newIndex = IndexPath(row: i, section: indexPath.section)
//                    indices.append(newIndex)
//                }
//
//                UIView.animate(withDuration: 0.7, delay: 0, options: .curveEaseInOut, animations: {
//                    collectionView.insertItems(at: indices)
//                }, completion: nil)
//
//                self.newExpand()
//
//            }
//        }
//    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        //TODO: Fix flagging and find ways to access visible cells
        
//        guard let indexPath = customCollectionView.indexPathForItem(at: CGPoint(x: 0, y: scrollView.contentOffset.y)) else {
//            return
//        }
//        guard let item = customCollectionView.cellForItem(at: indexPath) else {
//            return
//        }
//        print(item.frame)
        
//        let topMostCellY: CGFloat = 400 //Get the highest cell minY when it's expanded
//        let bottomMostCellY: CGFloat = 500 //Get the lowest cell maxY when it's expanded
//
//        if scrollView.contentOffset.y < topMostCellY {
//            scrollView.contentOffset.y = topMostCellY
//        } else if scrollView.contentOffset.y > bottomMostCellY {
//            scrollView.contentOffset.y = bottomMostCellY
//        }
        
    }
    
}

extension HomeViewController: RoundedCellDelegate {
    
    func backButtonPressed(onCell: RoundedCell)  {
        //Trigger cell collapse here
        let collectionView = customCollectionView
        guard let indexPath = collectionView.indexPath(for: onCell) else {
            print("indexPath not found")
            return
        }
        
        sectionDataTest[indexPath.section].opened = false
        
        self.scrollToTargetCell(to: indexPath, yOffset: 0, completion: {
            
        })
        
        var indices = [IndexPath]()
        
        for i in 1 ... self.sectionDataTest[indexPath.section].cellData.count {
            let newIndex = IndexPath(row: i, section: indexPath.section)
            indices.append(newIndex)
        }
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
            collectionView.deleteItems(at: indices)
        }, completion: { (true) in
            self.sectionDataTest[indexPath.section].cellData.removeAll()
        })
        
        self.newCollapse()

    }
}



//Delegate to retrieve section data
protocol StackingLayoutDelegate: class {
    func isSectionOpened(at: Int) -> (Bool, Int)
}

extension HomeViewController: StackingLayoutDelegate {
    func isSectionOpened(at: Int) -> (Bool, Int) {
        return (sectionDataTest[at].opened, at)
    }
}

class ContainerLayout: UICollectionViewFlowLayout {
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        guard let containerCollectionView = self.collectionView else {
            print("collection view was nil")
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
//            print(distanceToCenter, "distance toc enter ? constat")
            if fabsf(Float(itemOffset - horizontalOffset)) < fabsf(Float(offsetAdjustment)) {
                offsetAdjustment = itemOffset - horizontalOffset + distanceToCenter
                //                offsetAdjustment = itemCenter - screenCenter
            }
        })
        
        let adjustedPosition = proposedContentOffset.x + offsetAdjustment
        
        
        
        return CGPoint(x: adjustedPosition, y: proposedContentOffset.y)
    }
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
        
        attribute.zIndex = (attribute.indexPath.row) * -1 - sectionDataTest.count
    
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
            print("Attribute in section \(attribute.indexPath.section), row: \(attribute.indexPath.row) with zIndex: \(attribute.zIndex)")
            if attribute.indexPath.row == 0 {
                if (isBeingOpened && sectionDataTest[attribute.indexPath.section].opened){
                    attribute.zIndex = 0
//                    print("Attribute in section \(attribute.indexPath.section), row: \(attribute.indexPath.row) with zIndex: \(attribute.zIndex)")
                    isBeingOpened = false
                } else {
                    attribute.zIndex = attribute.indexPath.section * -1
                }
            }
//            } else {
//                attribute.zIndex = (attribute.indexPath.row) * -1
//            }
            print("section: \(attribute.indexPath.section), row: \(attribute.indexPath.row), index: \(attribute.zIndex), isOpened \(sectionDataTest[attribute.indexPath.section].opened)")
            print("isBeingOpened \(isBeingOpened)")
        }

        return allAttributes
    }
    
    override func finalLayoutAttributesForDisappearingItem(at itemIndexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        guard let attribute = super.finalLayoutAttributesForDisappearingItem(at: itemIndexPath) else {
            return nil
        }
        print("dissapearing cell -> section: \(itemIndexPath.section), row \(itemIndexPath.row) zindex \(attribute.zIndex)")
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


