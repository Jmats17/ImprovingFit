//
//  GymViewController.swift
//  ImprovingFit
//
//  Created by Justin Matsnev on 4/2/15.
//  Copyright (c) 2015 ImprovingFit. All rights reserved.
//

import Foundation
import UIKit

class GymViewController : UIViewController {
    
    
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var label : UILabel!
    @IBOutlet var image : UIImageView!

    
    override func viewDidLoad() {
        
        var color : UIColor = UIColor.blackColor()
        
        super.viewDidLoad()
        label.layer.borderWidth = 3.0
        label.layer.borderColor = color.CGColor
        label.layer.cornerRadius = 10.0
        self.label.clipsToBounds = true


    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func segmentChanged(sender: AnyObject) {
        
//        switch segmentedControl.selectedSegmentIndex
//        {
//         
//            
//            
//            
//        }
        
    }
    
    
}