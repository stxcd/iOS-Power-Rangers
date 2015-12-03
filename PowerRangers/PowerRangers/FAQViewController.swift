//
//  FirstViewController.swift
//  PowerRangers
//
//  Created by Tommy on 11/9/15.
//  Copyright © 2015 Tommy. All rights reserved.
//

import UIKit

class FAQViewController: UIViewController {
    
    //MARK: Properties
    
    var question1 = "When will I find out where I will be located/what my first rotation will be?"
    var question2 = "When do I need to start looking for an apartment?"
    var question3 = "How does Relocation work?"
    var question4 = "How and when will I receive my reimbursements/bonuses?"
    var question5 = "How often do we get paid?  When do we get our first paycheck?"
    var question6 = "When do we find out about our benefits/insurance, and how many weeks’ vacation do we get?"
    var question7 = "How do I book travel/hotel for symposium week?"
    var question8 = "When will I find out about my second rotation?"
    var question9 = "How long and often after accepting should I expect to hear from Synchrony?"
    var question10 = "What is symposium week?"
    var question11 = "What can I expect during symposium?"
    var question12 = "Who is Steve Kennedy’s barber?"
    
    
    
    var answer1 = "This information is usually sent out to the incoming BLPs sometime in May.  This way, BLPs have around 2 months to find housing, which is plenty of time."
    var answer2 = "Once you know your location, you should start looking for an apartment around 2 months before you start.  This will give you enough time for some online searching and to go visit some of the places that you have picked out"
    var answer3 = "Relocation is handled by our vendor, Cartus.  If you are over 50 miles away, you may opt for a $3500 relocation bonus.  If you are moving under 50 miles away or you do not opt for the $3500 relocation bonus, Cartus will pack up, transport, and unpack all of your belongings (cars included) for you.  If you choose this option, you will also receive a $1000 relocation bonus."
    var answer4 = "Relocation reimbursements and bonuses will most likely be paid out in your first or second paycheck. In order to be reimbursed you must save and submit receipts. If you are driving your own vehicle to your new location you will be reimbursed for gas based on miles traveled."
    var answer5 = "Pay cycles last two weeks and paychecks are received every other Friday. You will receive your first check at the end of the first pay cycle from your start date. Direct Deposit can be set up through the Synchrony HR Portal, instructions for Direct Deposit will be covered during Symposium Week."
    var answer6 = "Benefits, insurance information, vacation days, and similar information will be passed along to you during onboarding, and will also be explained in depth during Symposium Week."
    var answer7 = "You will book your travel (airfare, rental cars, etc) however you choose and will be reimbursed for all arrangements you make. Be sure to save all receipts from booked travel and any expenses during symposium week. If you are driving to Stamford in your personal car, you will be reimbursed for gas roundtrip based on the total miles driven between your start point and Stamford. Hotel accommodations will be booked for you under your name at the Marriot in Stamford, all you will need to do is check in."
    var answer8 = "Depending on your track you may find out about your next rotations sooner than other tracks. You should have details about your next rotation no later than 6 months into your current rotation."
    var answer9 = "After accepting your offer, you should hear from a Synchrony representative about once a month leading up to your start date. You will also be given a Buddy, someone who is currently a Synchrony employee and has gone through the leadership program in the past. You can reach out to any of the Synchrony employees and your buddy at any time with any questions or concerns regarding your upcoming rotation."
    var answer10 = "Symposium week is five days of planned events, team activities, information sessions, and guest speakers. This week will serve as your introduction to everything you need to know about Synchrony Financial and the BLP program, give you the opportunity to get to know the other BLP’s, and introduce you to senior leadership."
    var answer11 = "During symposium week there will be all sorts of events and activities planned for the BLP’s to engage with each other and senior leadership. This week will serve to expose you to how Synchrony Financial operates as an organization as well as what our core values are. Should you have any questions about your rotation or Synchrony Financial this is the perfect time to ask."
    var answer12 = "We're working on it."
    
    
    
    
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var answerLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: Actions
    
    @IBAction func question1Button(sender: UIButton) {
        questionLabel.text = question1
        answerLabel.text = answer1
    }
    
    @IBAction func question2Button(sender: UIButton) {
        questionLabel.text = question2
        answerLabel.text = answer2
    }

    @IBAction func question3Button(sender: UIButton) {
        questionLabel.text = question3
        answerLabel.text = answer3
    }
    
    @IBAction func question4Button(sender: UIButton) {
        questionLabel.text = question4
        answerLabel.text = answer4
    }
    
}

