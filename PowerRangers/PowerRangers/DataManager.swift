//
//  DataManager.swift
//  Power Rangers
//
//  Created by Zack on 11/17/15.
//  Copyright © 2015 Zack. All rights reserved.
//

import Foundation
import Parse


class DataManager {

    class func getBlpProfileFromParse(completion:((profiles:[PFObject]?) -> Void)) {
        let query = PFQuery(className: "BlpUser")
        query.findObjectsInBackgroundWithBlock { (profiles, error) -> Void in
            completion(profiles: profiles)
        }
    }
    
    class func getBlpHousingUserFromParse(firstName:String, completion:((profiles:[PFObject]?) -> Void)) {
        let query = PFQuery(className: "HousingUser")
        query.whereKey("firstName", equalTo: firstName)
        query.findObjectsInBackgroundWithBlock { (profiles, error) -> Void in
            completion(profiles: profiles)
        }
    }
    
    
}

//1
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
//        //2
//        let filePath = NSBundle.mainBundle().pathForResource("blpProfilePage",ofType:"json")
//
//        var readError:NSError?
//        do {
//            let data = try NSData(contentsOfFile:filePath!, options: NSDataReadingOptions.DataReadingUncached)
//            success(data: data)
//        } catch let error as NSError {
//            readError = error
//        } catch {
//            fatalError()
//        }
//    })
//    }
//
//    class func getHousing(success: ((data: NSData!) -> Void)) {
//
//            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
//                //2
//                let filePath = NSBundle.mainBundle().pathForResource("housing",ofType:"json")
//
//                var readError:NSError?
//                do {
//                    let data = try NSData(contentsOfFile:filePath!, options: NSDataReadingOptions.DataReadingUncached)
//                    success(data: data)
//                } catch let error as NSError {
//                    readError = error
//                } catch {
//                    fatalError()
//                }
//            })
//        }