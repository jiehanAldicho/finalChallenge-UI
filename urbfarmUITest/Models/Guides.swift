//
//  Guides.swift
//  urbfarmUITest
//
//  Created by Andy Aldicho on 19/01/19.
//  Copyright © 2019 Andy Jiehan Aldicho. All rights reserved.
//

import UIKit

struct Guide {
    enum difficulty {
        case easy
        case intermediate
        case advanced
    }
    
    var title: String?
    var difficulty: difficulty?
    var author: String? //Should be user object
    var plantType: String?
    var duration: Int?
    var description: String?
    var requirements: [String]?
    var plantImage: UIImage?
    var dateCreated: Date?
    
    //TODO: 👇🏽
    //var id: Int?
    //var dailyGuide: [DailyGuide]?
}
