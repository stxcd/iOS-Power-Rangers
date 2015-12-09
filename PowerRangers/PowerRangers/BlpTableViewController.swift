//
//  BlpTableViewController.swift
//  PowerRangers
//
//  Created by Zack on 11/20/15.
//  Copyright © 2015 Tommy. All rights reserved.
//

import UIKit

class BlpTableViewController: UITableViewController, UISearchBarDelegate, UISearchDisplayDelegate {
    
    @IBOutlet var filterContainerView: UIView!
    
    
    var blpArray = [Blp]()
    
    let blpArrayManager = BlpArrayManager()
    var filteredBlpArray = [String: String]()
    // master array which contains all blp instances on first load
    private var masterArray = [Blp]()
    
    let filterDictionary = [0:["Alpharetta", "Atlanta", "Canton", "Charlotte", "Chicago", "Costa Mesa", "Kettering", "St. Paul", "Stamford"], 1:["Audit", "Data Analytics", "Finance", "HR", "IT", "Marketing", "Operations", "Risk", "Sales"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        grabNames()
        
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return self.blpArrayManager.array.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("BlpTableViewCell", forIndexPath: indexPath) as! BlpTableViewCell
        
            let blpProfile = self.blpArrayManager.array[indexPath.row]
            cell.nameLabel.text = "\(blpProfile.name) \(blpProfile.lastName)"
//          blpProfile.location
            cell.trackLabel.text = "\(blpProfile.track), \(blpProfile.location)"
            
            //Housing check
            let house = UIImage (named: "Housing")!
            cell.housingIcon.image = house
        
            if blpProfile.housing == "No" {
            cell.housingIcon.hidden = true
            } else {
                cell.housingIcon.hidden = false
                cell.housingIcon.image = house
            }
        
            return cell
    }
    
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
    
    func filterBy(filter:String) {
        
        var filteredArray = [Blp]()
        
        if filter == "Location" {
            for blp in self.blpArrayManager.array {
                if blp.location == filter {
                    filteredArray.append(blp)
                }
            }
        }else if filter == "Track" {
            for blp in self.blpArrayManager.array {
                if blp.location == filter {
                    filteredArray.append(blp)
                }
            }
        }
    }
    
    func presentErrorMessage() -> UIAlertController {
        let alert = UIAlertController(title: "Invalid Search", message: "Please enter a valid search", preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .Cancel, handler: nil))
        return alert
    }
    
    func checkIfSearchIsValid(text:String?, tag:Int) -> Bool {
        
        var valid = false
        
        if let t = text {
            if t == "" {
                presentViewController(presentErrorMessage(), animated: true, completion: nil)
                valid = false
            }else {
                if tag == 0 {
                    let array = filterDictionary[0]!
                    for filterOption in array {
                        if filterOption == text! {
                            filterBySearchText(filterOption, key:"location")
                            return true
                        }
                    }
                }else {
                    let array = filterDictionary[1]!
                    for filterOption in array {
                        if filterOption == text! {
                            filterBySearchText(filterOption, key:"track")
                            return true
                        }
                    }
                }
            }
        }else {
            presentViewController(presentErrorMessage(), animated: true, completion: nil)
            valid = false
        }
        return valid
    }
    
    func filterBySearchText(filterOption:String, key:String) {
        var filteredArray = [Blp]()
        
        switch key {
        case "location":
            for blp in masterArray {
                if blp.location == filterOption {
                    filteredArray.append(blp)
                }
            }
        case "track":
            for blp in masterArray {
                if blp.track == filterOption {
                    filteredArray.append(blp)
                }
            }
        default:
            break
        }
        
        self.blpArrayManager.array = filteredArray
        self.tableView.reloadData()
    }
    
    func dismissFilterContainer() {
        UIView.animateWithDuration(1, animations: { () -> Void in
            self.filterContainerView.frame = CGRectMake(0, -self.filterContainerView.frame.height, self.view.frame.width, self.filterContainerView.frame.height)
            self.filterContainerView.alpha = 0
            }) { (success) -> Void in
                self.filterContainerView.removeFromSuperview()
        }
    }
}

// UITextFieldDelegate

extension BlpTableViewController:UITextFieldDelegate {
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        if textField.tag == 0 {
            return checkIfSearchIsValid(textField.text, tag: 0)
        }else {
            return checkIfSearchIsValid(textField.text, tag: 1)
        }
    }

}

extension BlpTableViewController {
    
    @IBAction func clearFilters(sender: AnyObject) {
        self.blpArrayManager.array = masterArray
        self.tableView.reloadData()
    }
    
    @IBAction func dismissView(sender: AnyObject) {
        dismissFilterContainer()
    }
    
    @IBAction func FilterByLocationOrTrack(sender: UIBarButtonItem) {
        self.filterContainerView.alpha = 0
        self.view.addSubview(self.filterContainerView)
        UIView.animateWithDuration(1) { () -> Void in
            self.filterContainerView.alpha = 1
            self.filterContainerView.frame = CGRectMake(0, 0, self.view.frame.width, self.filterContainerView.frame.height)
    
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
                    self.masterArray = self.blpArrayManager.array
                    self.tableView.reloadData()
                })
            } catch {
                print("error serializing JSON: \(error)")
            }
            
        }
        
    }
}




   