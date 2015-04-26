//
//  WaitlistViewController.swift
//  ImprovingFit
//
//  Created by Justin Matsnev on 4/25/15.
//  Copyright (c) 2015 ImprovingFit. All rights reserved.
//

import Foundation
import UIKit

class WaitlistViewController : UIViewController {
    
    @IBOutlet var label : UILabel!
    @IBOutlet var button : UIButton!
    @IBOutlet var gray : UIImageView!
    @IBOutlet var gray1 : UIImageView!
    @IBOutlet var pic : UIImageView!
    
    override func viewDidLoad() {
        self.pic.layer.cornerRadius = 10
        self.pic.clipsToBounds = true
    }

    @IBAction func addButton(sender : AnyObject) {
        let alertController = UIAlertController(title: "Member Added To Class!", message:
            "Justin M. Has Now Been Added To 9am Fitness Class", preferredStyle: UIAlertControllerStyle.Alert)
       // let alertController1 = UIAlertController(title: "Class size Is Now: 15 people", message:
         //   "Next Class: Tomorrow @ 9am ", preferredStyle: UIAlertControllerStyle.Alert)
        func close() {
        alertController.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle.Default,handler: nil))
            
            label.hidden = true
            button.hidden = true
            gray.hidden = true
            gray1.hidden = true
            pic.hidden = true
        }
        close()
        self.presentViewController(alertController, animated: true, completion: nil)

        
        
    }
    
    
    
}