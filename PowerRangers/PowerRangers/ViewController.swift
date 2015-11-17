//
//  ViewController.swift
//  JSON testing
//
//  Created by Zack on 11/16/15.
//  Copyright © 2015 Zack. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        
        var names = [String]()
        DataManager.grabNames { (data) -> Void in
        do {
            let json = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)
            
            if let blps = json["blps"] as? [[String: AnyObject]] {
                for blps in blps {
                    if let firstName = blps["firstName"] as? String {
                        names.append(firstName)
                    }
                }
            }
        } catch {
            print("error serializing JSON: \(error)")
            }
        
        print(names) // ["Bloxus test", "Manila Test"]
        
        }
        
    
}
    
            
    
            
          /*  DataManager.grabNames{ (data) -> Void in
                // Get the number 1 app using optional binding and NSJSONSerialization
                //1
                var parseError: NSError?
                
                do {
                    if let parsedObject = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments) as? NSDictionary {
                        if let topApps = parsedObject as? NSDictionary {
                            if let feed = topApps["feed"] as? NSDictionary {
                                if let apps = feed["entry"] as? NSArray {
                                    if let firstApp = apps[0] as? NSDictionary {
                                        if let imname = firstApp["im:name"] as? NSDictionary {
                                            if let appName = imname["label"] as? NSString {
                                                //3
                                                print("Optional Binding: \(appName)")
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                } catch {
                    print(parseError)
                }
                
            }
            
            super.viewDidLoad()
    }
    */
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
