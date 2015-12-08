//
//  BlpTableViewController.swift
//  PowerRangers
//
//  Created by Zack on 11/20/15.
//  Copyright © 2015 Tommy. All rights reserved.
//

import UIKit

class BlpTableViewController: UITableViewController {
    
    var blpArray = [Blp]()
    
    let blpArrayManager = BlpArrayManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        grabNames()
        
    }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return self.blpArrayManager.array.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("BlpTableViewCell", forIndexPath: indexPath) as! BlpTableViewCell
        
            let blpProfile = self.blpArrayManager.array[indexPath.row]
            cell.nameLabel.text = blpProfile.name
//          blpProfile.location
            cell.trackLabel.text = "\(blpProfile.track), \(blpProfile.location)"
            
            //Housing check
            let house = UIImage (named: "Housing")!
            cell.housingIcon.image = house
//            let houseCheck = blpProfile.housing
        
//            if (houseCheck == "No") {
//            cell.housingIcon.hidden = true
//            } else {
//                cell.housingIcon.image = house
//            }
        
            return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // Segue to the individual profiles
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showProfile" {
            let blpDetailViewController = segue.destinationViewController as! viewSpecificBlp
            
            //get the cell that generates segue
            
            if let selectedBlpCell = sender as? BlpTableViewCell {
                let indexPath = tableView.indexPathForCell(selectedBlpCell)!
                let selectedBlp = self.blpArrayManager.array[indexPath.row]
                blpDetailViewController.blp = selectedBlp
            }
        }
    }
    
}

private extension BlpTableViewController {
    
    func grabNames() {
        
        DataManager.grabNames { (data) -> Void in
            do {
                let json = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)
                
                if let blps = json["blps"] as? [[String: AnyObject]] {
                    for blps in blps {
                        let profile = Blp(d: blps)
                        self.blpArrayManager.setBlp(profile)
                    }
                }
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.tableView.reloadData()
                })
            } catch {
                print("error serializing JSON: \(error)")
            }
            
        }
        
    }
}




   