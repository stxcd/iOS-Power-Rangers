//
//  DataManager.swift
//  Power Rangers
//
//  Created by Zack on 11/17/15.
//  Copyright © 2015 Zack. All rights reserved.
//

import Foundation

var housingURL = "https://uat.onlinecreditcenter6.com/cs/groups/cmswebsite/documents/websiteasset/ios_housing.json"

class DataManager {

class func grabNames(success: ((data: NSData) -> Void)) {
    //1
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
        //2
        let filePath = NSBundle.mainBundle().pathForResource("blpProfilePage",ofType:"json")
        
        var readError:NSError?
        do {
            let data = try NSData(contentsOfFile:filePath!, options: NSDataReadingOptions.DataReadingUncached)
            success(data: data)
        } catch let error as NSError {
            readError = error
        } catch {
            fatalError()
        }
    })
    }

    class func getHousing(success: ((housingData: NSData!) -> Void)) {
        //1
        loadDataFromURL(NSURL(string: housingURL)!, completion:{(data, error) -> Void in
            //2
            if let urlData = data {
                //3
                success(housingData: urlData)
            }
        })
    }
    
    class func loadDataFromURL(url: NSURL, completion:(data: NSData?, error: NSError?) -> Void) {
        let session = NSURLSession.sharedSession()
        
        // Use NSURLSession to get data from an NSURL
        let loadDataTask = session.dataTaskWithURL(url, completionHandler: { (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            if let responseError = error {
                completion(data: nil, error: responseError)
            } else if let httpResponse = response as? NSHTTPURLResponse {
                if httpResponse.statusCode != 200 {
                    let statusError = NSError(domain:"domain", code:httpResponse.statusCode, userInfo:[NSLocalizedDescriptionKey : "HTTP status code has unexpected value."])
                    completion(data: nil, error: statusError)
                } else {
                    completion(data: data, error: nil)
                }
            }
        })
        
        loadDataTask.resume()
    }
}