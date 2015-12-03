//
//  editMyProfile.swift
//  PowerRangers
//
//  Created by Kimberly on 11/23/15.
//  Copyright © 2015 Tommy. All rights reserved.
//

import UIKit

class editMyProfile: UIViewController{
    
    //Outlets for textfields. Order is same as on storyboard
    @IBOutlet weak var fieldA: UITextField!
    @IBOutlet weak var fieldB: UITextField!
    @IBOutlet weak var fieldC: UITextField!
    @IBOutlet weak var fieldD: UITextField!
    @IBOutlet weak var fieldE: UITextField!
    @IBOutlet weak var fieldF: UITextField!
    @IBOutlet weak var fieldG: UITextField!
    @IBOutlet weak var fieldH: UITextField!
    @IBOutlet weak var fieldI: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.

    
    }
    
    @IBAction func btnSubmit(sender: AnyObject) {
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "btnSubmitSegue"){
            let svc = segue.destinationViewController as! ViewMyProfile
            svc.dataPassed = fieldA.text
            svc.secondDataPassed = fieldB.text
            svc.thirdDataPassed = fieldC.text
            svc.fourthDataPassed = fieldD.text
            svc.fifthDataPassed = fieldE.text
            svc.sixthDataPassed = fieldF.text
            svc.seventhDataPassed = fieldG.text
            svc.eighthDataPassed = fieldH.text
            svc.nighthnDataPassed = fieldI.text
        }
    }
    
    }