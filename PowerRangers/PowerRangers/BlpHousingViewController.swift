//
//  blpHousingViewController.swift
//  PowerRangers
//
//  Created by Zack on 11/30/15.
//  Copyright © 2015 Tommy. All rights reserved.
//

import UIKit

class BlpHousingViewController: UIViewController {

let blpHousingArrayManager = BlpHousingArrayManager()
    
    var blp: BlpHousing?
    var ident : Int = 0
    
    @IBOutlet weak var firstNameLabel: UILabel!
    
    @IBOutlet weak var lastNameLabel: UILabel!
    
    @IBOutlet weak var blpImage: UIImageView!
    
    @IBOutlet weak var priceImage: UIImageView!
    
    @IBOutlet weak var smokingImage: UIImageView!
    
    @IBOutlet weak var genderImage: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getHousing()
        
       // setLabels()
        print(self.blpHousingArrayManager.array)
    }
    
        
        // Do any additional setup after loading the view.
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setLabels (){
        let housingProf = self.blpHousingArrayManager.array[ident]
        
        firstNameLabel.text = housingProf.firstName
        lastNameLabel.text = housingProf.lastName
        
        
        let useName = housingProf.lastName
        let blpPic = UIImage(named: useName)
        blpImage.image = blpPic
        
        //pull correct price image
        let pricePull = housingProf.priceRange
        let priceString = "price"+pricePull
        let pricePic = UIImage(named: priceString)
        priceImage.image = pricePic
        
        //pull correct smoking image
        let smokingPull = housingProf.smoking
        let smokingString = "smoking"+smokingPull
        let smokingPic = UIImage(named: smokingString)
        smokingImage.image = smokingPic
        
        //pull correct gender image
        let genderPull = housingProf.roommateGender
        let genderString = "gender"+genderPull
        let genderPic = UIImage(named: genderString)
        genderImage.image = genderPic
        
    
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

private extension BlpHousingViewController {
    
    func getHousing() {
        
        DataManager.getHousing { (data) -> Void in
            do {
                let json = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)
                
                if let blps = json["housing"] as? [[String: AnyObject]] {
                    for blps in blps {
                        let profile = BlpHousing(d: blps)
                        self.blpHousingArrayManager.setBlp(profile)
                    }
                }
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.setLabels()
                })
                
            } catch {
                print("error serializing JSON: \(error)")
            }
            
        }
        
    }
}
