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
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sectionDataTest.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if sectionDataTest[section].opened == true {
            return 3
        } else {
            return 1
        }
    }
    
    //Line spacing for section
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if section != 0 {
            if sectionDataTest[section - 1].opened == true {
                print("section above opened")
                return UIEdgeInsets(top: 100, left: 0, bottom: -100, right: 0)
                
            }
        }
        
        return UIEdgeInsets(top: 0, left: 0, bottom: -100, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "roundedCell", for: indexPath) as! RoundedCell
//        let colors = [#colorLiteral(red: 0.8563432097, green: 0.4937818646, blue: 0.6653347015, alpha: 1), #colorLiteral(red: 0.5605105162, green: 0.3113227487, blue: 0.7327066064, alpha: 1), #colorLiteral(red: 0.08446101099, green: 0.01631886512, blue: 0.1807191968, alpha: 1)]
//
//        cell.backgroundColor = colors[indexPath.section % 3]
//        cell.cellTitleLabel.text = sectionDataTest[indexPath.section].title
//        cell.delegate = self
//
////      Don't use layer since it messes up the constraint animation calculation
////        cell.layer.zPosition =  -1 * CGFloat(indexPath.row)
//
//        return cell
        
        if indexPath.row == 0 {
            let header = collectionView.dequeueReusableCell(withReuseIdentifier: "roundedCell", for: indexPath) as! RoundedCell
            let colors = [#colorLiteral(red: 0.8563432097, green: 0.4937818646, blue: 0.6653347015, alpha: 1), #colorLiteral(red: 0.5605105162, green: 0.3113227487, blue: 0.7327066064, alpha: 1), #colorLiteral(red: 0.08446101099, green: 0.01631886512, blue: 0.1807191968, alpha: 1)]
            
            header.backgroundColor = colors[indexPath.section % 3]
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
        if indexPath.row == 1 {
            cellHeight = 250
        } else if indexPath.row == 2 {
            cellHeight = 480
        }
        return CGSize(width: view.frame.width, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let cell = collectionView.cellForItem(at: indexPath) as! RoundedCell
//        let cellHeight = cell.frame.height
//        let yOffset = ((cellHeight) * CGFloat(indexPath.section)) - ((cellHeight/3) * CGFloat(indexPath.section - 1))
        
        //TODO: Scroll the collection view first and then animate it
//        collectionView.scrollToItem(at: indexPath, at: .top, animated: true)

//        self.expandCell(collectionViewYOffset: yOffset)
//        cell.showBackButton()

        
//        self.scrollToTargetCell(to: indexPath) {
////            self.expandCell(collectionViewYOffset: yOffset)
////            cell.showBackButton()
////            self.tabBar.alpha = 0
//        }
        
//        let cell = collectionView.cellForItem(at: indexPath)
//        print(cell, "zIndex \(cell.attri)")
        
        if indexPath.row == 0 {
            if sectionDataTest[indexPath.section].opened == true {
                sectionDataTest[indexPath.section].opened = false
                
                collectionView.performBatchUpdates({
                    let sections = IndexSet.init(integer: indexPath.section)
                    collectionView.reloadSections(sections)
                }, completion: nil)
                
            } else {
                sectionDataTest[indexPath.section].opened = true
                
                collectionView.performBatchUpdates({
                    let sections = IndexSet.init(integer: indexPath.section)
                    collectionView.reloadSections(sections)
                }, completion: nil)
            }
        }
    }
    
}

class ContentCell: RoundedCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class BottomContentCell: RoundedCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = #colorLiteral(red: 0.1778279543, green: 0.0857173875, blue: 0.2522138655, alpha: 1)
    }
    
    override func roundCorner() {
        self.layer.cornerRadius = 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//Did not use cell layer's z position because it can't be clicked properly
class StackingLayout: UICollectionViewFlowLayout {
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let allAttributes = super.layoutAttributesForElements(in: rect) else {
            return nil
        }
        for attribute in allAttributes {
            if attribute.indexPath.row == 0 {
                attribute.zIndex = attribute.indexPath.section * -1
            } else {
                attribute.zIndex = (attribute.indexPath.row) * -1
            }
//            print("zindex: \(attribute.zIndex), section: \(attribute.indexPath.section), row: \(attribute.indexPath.row)")
        }
        return allAttributes
    }

}


