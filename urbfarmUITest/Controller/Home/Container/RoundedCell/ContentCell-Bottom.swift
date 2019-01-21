//
//  ContentCell-Bottom.swift
//  urbfarmUITest
//
//  Created by Andy Jiehan on 15/01/19.
//  Copyright © 2019 Andy Jiehan Aldicho. All rights reserved.
//

import UIKit

class BottomContentCell: RoundedCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
    }
    
    override func roundCorner() {
        self.layer.cornerRadius = 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
