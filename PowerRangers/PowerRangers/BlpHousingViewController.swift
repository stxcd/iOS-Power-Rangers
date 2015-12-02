//
//  blpHousingViewController.swift
//  PowerRangers
//
//  Created by Zack on 11/30/15.
//  Copyright © 2015 Tommy. All rights reserved.
//

import UIKit

class BlpHousingViewController: UIViewController {
    
    var blp: BlpHousing?
    
    @IBOutlet weak var firstNameLabel: UILabel!
    
    @IBOutlet weak var lastNameLabel: UILabel!
    
    @IBOutlet weak var blpImage: UIImageView!
    
    @IBOutlet weak var priceImage: UIImageView!
    
    @IBOutlet weak var smokingImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstNameLabel.text = blp?.firstName
        lastNameLabel.text = blp?.lastName
        
        
        let useName = blp?.lastName
        let blpPic = UIImage(named: useName!)
        blpImage.image = blpPic
        
        //pull correct price image
        let pricePull = blp?.priceRange
        let priceString = "Price"+pricePull!
        let pricePic = UIImage(named: priceString)
        priceImage.image = pricePic
        
        //pull correct smoking image
        let smokingPull = blp?.smoking
        let smokingString = "smoking"+smokingPull!
        let smokingPic = UIImage(named: smokingString)
        smokingImage.image = smokingPic
        
    }
    
        
        // Do any additional setup after loading the view.
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
