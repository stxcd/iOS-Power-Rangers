//
//  BlpHousingArrayManager.swift
//  PowerRangers
//
//  Created by Zack on 12/7/15.
//  Copyright © 2015 Tommy. All rights reserved.
//

import Foundation


class BlpHousingArrayManager {
    
    private var a = [HousingUser]()
    var array:[HousingUser] {
        return a
    }
    
    func setBlp(blp:HousingUser) {
        a.append(blp)
    }
    
}