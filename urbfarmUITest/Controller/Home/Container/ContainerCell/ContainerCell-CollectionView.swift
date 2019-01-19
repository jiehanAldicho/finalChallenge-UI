//
//  ContainerCell-CollectionView.swift
//  urbfarmUITest
//
//  Created by Andy Jiehan on 14/01/19.
//  Copyright © 2019 Andy Jiehan Aldicho. All rights reserved.
//

import UIKit

extension ContainerCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sectionDataTest.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if sectionDataTest[section].opened == true {
            return sectionDataTest[section].cellData.count + 1
        } else {
            return 1
        }
    }
    
    //Line spacing for section
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        //            if section != 0 {
        //                if sectionDataTest[section - 1].opened == true {
        //                    return UIEdgeInsets(top: 100, left: 0, bottom: -100, right: 0)
        //
        //                }
        //            }
        //
        return UIEdgeInsets(top: 0, left: 0, bottom: -100, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.row == 0 {
            let header = collectionView.dequeueReusableCell(withReuseIdentifier: "headerCell", for: indexPath) as! HeaderCell
            
            let cellNum = self.num
            
            let h: CGFloat = 130 * CGFloat(cellNum!) / 360
            let s: CGFloat = (39 - CGFloat(indexPath.section))     / 100
            let b: CGFloat = (51 - CGFloat(indexPath.section * 8)) / 100
   
            let color = indexPath.section < 5 ? UIColor(hue: h, saturation: s, brightness: b, alpha: 1) : #colorLiteral(red: 0.6892318726, green: 0.7184664011, blue: 0.7309170365, alpha: 1)
        
            header.backgroundColor = color
            header.cellTitleLabel.text = sectionDataTest[indexPath.section].title
            header.delegate = self
            
            return header
        } else if indexPath.row == 1{
            let contentCell = collectionView.dequeueReusableCell(withReuseIdentifier: "contentCell", for: indexPath) as! ContentCell
            
            return contentCell
        } else {
            let bottomCell = collectionView.dequeueReusableCell(withReuseIdentifier: "bottomCell", for: indexPath) as! BottomContentCell
            
            return bottomCell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var cellHeight: CGFloat = 300
        if isBeingOpened {
            if indexPath.row == 1 {
                cellHeight = 250
                return CGSize(width: self.frame.width, height: cellHeight)
            } else if indexPath.row == 2 {
                cellHeight = 900 //TODO: Calculate the remaining empty space
                return CGSize(width: self.frame.width, height: cellHeight)
            } else {
                return CGSize(width: self.frame.width, height: cellHeight)
            }
        } else {
            return CGSize(width: self.frame.width, height: cellHeight)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! HeaderCell //This will be guide / header cell
        
        if indexPath.row == 0 {
            if sectionDataTest[indexPath.section].opened == false {
                
                sectionDataTest[indexPath.section].opened = true
                
                
                self.scrollToTargetCell(to: indexPath, yOffset: 100, completion: {
                    
                })
                isBeingOpened = true
                isScrolled = false
                cell.showBackButton()
                
                //TODO: Refactor these shits
                sectionDataTest[indexPath.section].cellData.append("bannamna")
                sectionDataTest[indexPath.section].cellData.append("new shits")
                
                var indices = [IndexPath]()
                
                for i in 1 ... sectionDataTest[indexPath.section].cellData.count {
                    let newIndex = IndexPath(row: i, section: indexPath.section)
                    indices.append(newIndex)
                }
                
                
                
                UIView.animate(withDuration: 0.7, delay: 0, options: .curveEaseInOut, animations: {
                    collectionView.insertItems(at: indices)
                }) { (true) in
                }
                
                self.newExpand()
            }
        }
    }
    

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if isBeingOpened {
            var visibleIndexPaths = customCollectionView.indexPathsForVisibleItems
            
            if !(isScrolled) {
                visibleIndexPaths.sort(by: {$0[1]<$1[1]})
                
                currentVisibleCells.top = customCollectionView.cellForItem(at: visibleIndexPaths[0])
                currentVisibleCells.middle = customCollectionView.cellForItem(at: visibleIndexPaths[1])
                currentVisibleCells.bottom = customCollectionView.cellForItem(at: visibleIndexPaths[2])
                
                isScrolled = true
            }
            
            guard
                let topLimit = currentVisibleCells.top?.frame.minY,
                let bottomLimit = currentVisibleCells.bottom?.frame.maxY
            else {
                return
            }
            
            if scrollView.contentOffset.y < topLimit + 100 {
                scrollView.contentOffset.y = topLimit + 100
            } else if scrollView.contentOffset.y + self.superview!.frame.height > bottomLimit {
                scrollView.contentOffset.y = bottomLimit - self.superview!.frame.height
            }
        }
        
    }
    
}

extension ContainerCell: HeaderCellDelegate {
    
    func backButtonPressed(onCell: HeaderCell)  {
        let collectionView = customCollectionView
        guard let indexPath = collectionView.indexPath(for: onCell) else {
            print("indexPath not found")
            return
        }
        
       
        isBeingOpened = false
        sectionDataTest[indexPath.section].opened = false
        
        var indices = [IndexPath]()
        
        for i in 1 ... sectionDataTest[indexPath.section].cellData.count {
            let newIndex = IndexPath(row: i, section: indexPath.section)
            indices.append(newIndex)
        }
        
        sectionDataTest[indexPath.section].cellData.removeAll()
        
        self.scrollToTargetCell(to: indexPath, yOffset: 0) {
            
        }
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
            collectionView.deleteItems(at: indices)
            
        }, completion: { (true) in
            
        })
        
        
        self.newCollapse()
        
    }
}


extension ContainerCell: StackingLayoutDelegate {
    func isSectionOpened(at: Int) -> (Bool, Int) {
        return (sectionDataTest[at].opened, at)
    }
}
