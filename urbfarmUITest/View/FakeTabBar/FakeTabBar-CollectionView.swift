//
//  FakeTabBar-CollectionView.swift
//  urbfarmUITest
//
//  Created by Andy Jiehan on 06/01/19.
//  Copyright © 2019 Andy Jiehan Aldicho. All rights reserved.
//

import UIKit

extension FakeTabBar: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menus.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "menuCell", for: indexPath) as! MenuCell
        cell.menuIcon.image = UIImage(named: menus[indexPath.row])?.withRenderingMode(.alwaysTemplate)
        cell.menuLabel.text = menus[indexPath.row].uppercased()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 50, height: 65)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let remainingWidth = collectionView.frame.width - CGFloat(100
            * menus.count)
        print(remainingWidth)
//        let inset = UIEdgeInsets(top: 0, left: remainingWidth/2, bottom: 0, right: remainingWidth / 2)
        let inset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        return inset
    }
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! MenuCell
        
        let colorAnimation = CABasicAnimation(keyPath: "borderColor")
        
        colorAnimation.fromValue = UIColor.lightGray.cgColor
        colorAnimation.toValue = UIColor.darkGray.cgColor
        colorAnimation.duration = 1
        colorAnimation.isRemovedOnCompletion = false
        colorAnimation.fillMode = .forwards
        cell.circleBG.layer.add(colorAnimation, forKey: "borderColor")
        
        UIView.transition(with: cell.menuLabel, duration: 1, options: .transitionCrossDissolve, animations: {
            cell.menuLabel.textColor = .darkGray
        }, completion: nil)
        
        
        UIView.animate(withDuration: 1) {
            cell.menuIcon.tintColor = .darkGray
//            cell.circleBG.layer.borderColor = UIColor.darkGray.cgColor
//            cell.menuLabel.textColor = .darkGray
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! MenuCell
        
        UIView.animate(withDuration: 1) {
            cell.menuIcon.tintColor = .lightGray
//            cell.circleBG.layer.borderColor = UIColor.lightGray.cgColor
            cell.menuLabel.textColor = .lightGray
        }
        
        //UILabel color is un-animatable, use cross dissolve transition instead
        UIView.transition(with: cell.menuLabel, duration: 1, options: .transitionCrossDissolve, animations: {
            cell.menuLabel.textColor = .lightGray
        }, completion: nil)
        
        let colorAnimation = CABasicAnimation(keyPath: "borderColor")
        
        
        colorAnimation.fromValue = UIColor.darkGray.cgColor
        colorAnimation.toValue = UIColor.lightGray.cgColor
        colorAnimation.duration = 1
        colorAnimation.isRemovedOnCompletion = false
        colorAnimation.fillMode = .forwards
        cell.circleBG.layer.add(colorAnimation, forKey: "borderColor")
    }
    
}
