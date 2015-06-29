//
//  MainPageViewController.swift
//  ImprovingFit
//
//  Created by Justin Matsnev on 6/22/15.
//  Copyright (c) 2015 ImprovingFit. All rights reserved.
//

import Foundation
import UIKit

class MainPageViewController : UIViewController, NSURLConnectionDelegate {
    
    @IBOutlet weak var logoImage : UIImageView!
    @IBOutlet weak var myGymButton : UIButton!

    var defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    var data = NSMutableData()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        myGymButton.layer.borderWidth = 1.0
        myGymButton.layer.borderColor = UIColor.blackColor().CGColor
        myGymButton.layer.cornerRadius = 2.0

    }
    
    override func viewDidAppear(animated: Bool) {
        var ActionSheet =  UIAlertController(title: "Choose Your Fitness Facility", message: "", preferredStyle: UIAlertControllerStyle.ActionSheet)
        if (defaults.valueForKey("newuser") == nil)  {
            
            let gym4 = UIAlertAction(title: "Lynn Family YMCA", style: UIAlertActionStyle.Default, handler: {
                (alert : UIAlertAction!) -> Void in
                self.startConnection("http://www.improvingfit.com/json/gymjson.php?gym=567")
                self.defaults.setValue(NSNumber(bool: true), forKey: "newuser")
                self.defaults.setObject("http://www.improvingfit.com/json/gymjson.php?gym=567", forKey: "gymID")
                self.defaults.setObject("lynn", forKey: "gymName")
                self.defaults.setObject(nil, forKey: "gymLogo")
                self.reloadInputViews()
            })
            let gym1 = UIAlertAction(title: "Melrose YMCA", style: UIAlertActionStyle.Default, handler: {
                (alert : UIAlertAction!) -> Void in
                self.startConnection("http://www.improvingfit.com/json/gymjson.php?gym=526")
                self.defaults.setValue(NSNumber(bool: true), forKey: "newuser")
                self.defaults.setObject("http://www.improvingfit.com/json/gymjson.php?gym=526", forKey: "gymID")
                self.defaults.setObject("melrose", forKey: "gymName")
                self.defaults.setObject("http://www.improvingfit.com/groupfitness/uploads/gymlogo526.jpg", forKey: "gymLogo")
                self.reloadInputViews()
                
            })
            let gym2 = UIAlertAction(title: "Saugus Family YMCA", style: UIAlertActionStyle.Default, handler: {
                (alert : UIAlertAction!) -> Void in
                self.startConnection("http://www.improvingfit.com/json/gymjson.php?gym=579")
                self.defaults.setObject("http://www.improvingfit.com/json/gymjson.php?gym=579", forKey: "gymID")
                self.defaults.setObject("saugus", forKey: "gymName")
                self.defaults.setObject("http://www.improvingfit.com/groupfitness/uploads/gymlogo579.jpg", forKey: "gymLogo")
                self.defaults.setValue(NSNumber(bool: true), forKey: "newuser")
                self.reloadInputViews()
            })
            let gym3 = UIAlertAction(title: "Torigian Family YMCA", style: UIAlertActionStyle.Default, handler: {
                (alert : UIAlertAction!) -> Void in
                self.startConnection("http://www.improvingfit.com/json/gymjson.php?gym=580")
                self.defaults.setObject("http://www.improvingfit.com/json/gymjson.php?gym=580", forKey: "gymID")
                self.defaults.setObject("torigian", forKey: "gymName")
                self.defaults.setObject("http://www.improvingfit.com/groupfitness/uploads/gymlogo580.jpg", forKey: "gymLogo")
                self.defaults.setValue(NSNumber(bool: true), forKey: "newuser")
                self.reloadInputViews()
            })
            
            ActionSheet.addAction(gym1)
            ActionSheet.addAction(gym2)
            ActionSheet.addAction(gym3)
            ActionSheet.addAction(gym4)
            self.showViewController(ActionSheet, sender: self)
        }
        else {
            if (defaults.valueForKey("newuser") != nil) {
                let a = defaults.stringForKey("gymID")
                startConnection(a!)
                
            }
        }
    }
  
    func startConnection(urll : String){
        let url : NSURL = NSURL(string: urll)!
        var request: NSURLRequest = NSURLRequest(URL: url)
        var connection: NSURLConnection = NSURLConnection(request: request, delegate: self, startImmediately: false)!
        connection.start()
    }
    
    func connection(connection: NSURLConnection!, didReceiveData data: NSData!){
        
        self.data.appendData(data)
    }
    
    
    func connectionDidFinishLoading(connection: NSURLConnection!) {
        var err: NSError
        var jsonResult: NSDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as! NSDictionary
    //    println(jsonResult)
        let values = jsonResult["gyminfo"]! as! [[String : AnyObject]]
        for value in values {
           
            let stringUrl = defaults.stringForKey("gymLogo")
            if stringUrl == nil {
                logoImage.image = UIImage(named: "exercise-with-dumbbells-symbol-hi.png")
            }
            else {
                let url = NSURL(string: stringUrl!)
                let data = NSData(contentsOfURL: url!)
                logoImage.image = UIImage(data: data!)
            }

          
        }
        
    }
}

