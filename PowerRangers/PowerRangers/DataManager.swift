//
//  DataManager.swift
//  JSON testing
//
//  Created by Zack on 11/17/15.
//  Copyright © 2015 Zack. All rights reserved.
//

import Foundation

class DataManager {

class func grabNames(success: ((data: NSData) -> Void)) {
    //1
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
        //2
        let filePath = NSBundle.mainBundle().pathForResource("BlpProfiles",ofType:"json")
        
        var readError:NSError?
        do {
            let data = try NSData(contentsOfFile:filePath!,
                options: NSDataReadingOptions.DataReadingUncached)
            success(data: data)
        } catch let error as NSError {
            readError = error
        } catch {
            fatalError()
        }
    })
}
}