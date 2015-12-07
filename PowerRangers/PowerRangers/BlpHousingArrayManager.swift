//
//  BlpHousingArrayManager.swift
//  PowerRangers
//
//  Created by Zack on 12/7/15.
//  Copyright © 2015 Tommy. All rights reserved.
//

import Foundation


class BlpHousingArrayManager {
    
    private var a = [BlpHousing]()
    var array:[BlpHousing] {
        return a
    }
    
    func setBlp(blp:BlpHousing) {
        a.append(blp)
    }
    
}