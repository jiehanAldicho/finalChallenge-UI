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
            return sectionDataTest[section].cellData.count + 1
        } else {
            return 1
        }
    }
    
    //Line spacing for section
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if section != 0 {
            if sectionDataTest[section - 1].opened == true {
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
            cellHeight = 565 //TODO: Calculate the remaining empty space
        }
        return CGSize(width: view.frame.width, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! RoundedCell

        isBeingOpened = !sectionDataTest[indexPath.section].opened
        if indexPath.row == 0 {
            if sectionDataTest[indexPath.section].opened == false {
                
                sectionDataTest[indexPath.section].opened = true
                
                self.scrollToTargetCell(to: indexPath, yOffset: 100, completion: {
                    cell.showBackButton()
                    //TODO: Refactor these shits
                    self.sectionDataTest[indexPath.section].cellData.append("bannamna")
                    self.sectionDataTest[indexPath.section].cellData.append("new shits")
                    
                    var indices = [IndexPath]()
                    
                    for i in 1 ... self.sectionDataTest[indexPath.section].cellData.count {
                        let newIndex = IndexPath(row: i, section: indexPath.section)
                        indices.append(newIndex)
                    }
                    
                    UIView.animate(withDuration: 0.7, delay: 0, options: .curveEaseInOut, animations: {
                        collectionView.insertItems(at: indices)
                    }, completion: nil)
                    
                    
                })
                self.newExpand()

            }
        }
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
            
            
        })
        self.newCollapse()

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
        self.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
    }
    
    override func roundCorner() {
        self.layer.cornerRadius = 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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


//Did not use cell layer's z position because it can't be clicked properly
class StackingLayout: UICollectionViewFlowLayout {
    
    //TODO: Fix index bug -> the layoutAttribute function is called twice because there are two animations (scrolling and expanding the section)
    
    weak var delegate: StackingLayoutDelegate?
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let allAttributes = super.layoutAttributesForElements(in: rect) else {
            return nil
        }
        for attribute in allAttributes {
            if attribute.indexPath.row == 0 {
                if (isBeingOpened){
                    attribute.zIndex = 0
                } else {
                    attribute.zIndex = attribute.indexPath.section * -1
                }
            } else {
                attribute.zIndex = (attribute.indexPath.row) * -1
            }
            print("section: \(attribute.indexPath.section), row: \(attribute.indexPath.row), index: \(attribute.zIndex), isBeingOpened \(isBeingOpened)")
        }
        isBeingOpened = false
        return allAttributes
    }
    
    override func prepare() {
//        print("prepare called")
    }

    override func initialLayoutAttributesForAppearingItem(at itemIndexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        guard let attribute = super.initialLayoutAttributesForAppearingItem(at: itemIndexPath) else {
            return nil
        }
        
        
        
        return attribute
    }
}


