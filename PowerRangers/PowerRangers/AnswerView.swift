//
//  AnswerView.swift
//  PowerRangers
//
//  Created by Trace Pomplun on 12/7/15.
//  Copyright © 2015 Tommy. All rights reserved.
//

import UIKit

protocol DismissAnswerView:class {
    func dismissAnswerView()
}

class AnswerView: UIView {
    
    @IBOutlet weak var answerLabel:UILabel!
    weak var delegate:DismissAnswerView?
    
    func setLablWithAnswer(s:String) {
        answerLabel.text = s
    }
    
}

extension AnswerView {
    @IBAction func dismissAnswerView(sender:UIButton) {
        self.delegate?.dismissAnswerView()
    }
}