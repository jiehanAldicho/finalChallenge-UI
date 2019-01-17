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
        
        if indexPath.row == 1 {
            collectionView.selectItem(at: indexPath, animated: false, scrollPosition: [])
            cell.isSelected = true
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let w = PropsConstant.MenuCell.width.rawValue
        let h = PropsConstant.MenuCell.height.rawValue
        return CGSize(width: w, height: h)
    }
    
    //TODO: Refactor animation functions
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath) as! MenuCell
        
        //Border animation have to use CABasic animation since it's layer and not UIView
        let colorAnimation = CABasicAnimation(keyPath: "borderColor")
        colorAnimation.fromValue = UIColor.lightGray.cgColor
        colorAnimation.toValue = UIColor.darkGray.cgColor
        colorAnimation.duration = 0.5
        colorAnimation.isRemovedOnCompletion = false
        colorAnimation.fillMode = .forwards
        colorAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        
        
        let borderWidthAnimation = CABasicAnimation(keyPath: "borderWidth")
        borderWidthAnimation.fromValue = 2
        borderWidthAnimation.toValue = 2.5
        borderWidthAnimation.duration = 0.5
        borderWidthAnimation.isRemovedOnCompletion = false
        borderWidthAnimation.fillMode = .forwards
        colorAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        
        cell.circleBG.layer.add(colorAnimation, forKey: "borderColor")
        cell.circleBG.layer.add(borderWidthAnimation, forKey: "borderWidth")
        
        //UILabel color is un-animatable, use cross dissolve transition instead
        UIView.transition(with: cell.menuLabel, duration: 0.5, options: .transitionCrossDissolve, animations: {
            cell.menuLabel.textColor = .darkGray
        }, completion: nil)
        
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
            cell.menuIcon.tintColor = .darkGray
            cell.menuLabel.font = UIFont(name: "Avenir-Black", size: 11)
        }, completion: nil)
        
        delegate?.selectedMenuAt(indexPath: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! MenuCell
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
            cell.menuIcon.tintColor = .lightGray
            cell.menuLabel.font = UIFont(name: "Avenir-Heavy", size: 11)
        }, completion: nil)
        
        //UILabel color is un-animatable, use cross dissolve transition instead
        UIView.transition(with: cell.menuLabel, duration: 0.5, options: .transitionCrossDissolve, animations: {
            cell.menuLabel.textColor = .lightGray
        }, completion: nil)
        
        //Border animation have to use CABasic animation since it's layer and not UIView
        let colorAnimation = CABasicAnimation(keyPath: "borderColor")
        colorAnimation.fromValue = UIColor.darkGray.cgColor
        colorAnimation.toValue = UIColor.lightGray.cgColor
        colorAnimation.duration = 0.5
        colorAnimation.isRemovedOnCompletion = false
        colorAnimation.fillMode = .forwards
        colorAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        
        let borderWidthAnimation = CABasicAnimation(keyPath: "borderWidth")
        borderWidthAnimation.fromValue = 2.5
        borderWidthAnimation.toValue = 2
        borderWidthAnimation.duration = 0.5
        borderWidthAnimation.isRemovedOnCompletion = false
        borderWidthAnimation.fillMode = .forwards
        colorAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        
        cell.circleBG.layer.add(colorAnimation, forKey: "borderColor")
        cell.circleBG.layer.add(borderWidthAnimation, forKey: "borderWidth")
    }
    
}
