//
//  GymViewController.swift
//  ImprovingFit
//
//  Created by Justin Matsnev on 4/2/15.
//  Copyright (c) 2015 ImprovingFit. All rights reserved.
//

import Foundation
import UIKit
class GymViewController : UIViewController,NSURLConnectionDelegate {
    
    
    @IBOutlet var titleLabel : UILabel!
    @IBOutlet var descriptionLabel : UILabel!
    @IBOutlet var imageGym : UIImageView!

    var data = NSMutableData()
    var defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()

    override func viewDidLoad() {
        
        var color : UIColor = UIColor.blackColor()
        super.viewDidLoad()
        descriptionLabel.backgroundColor = UIColor.darkGrayColor().colorWithAlphaComponent(0.1)
        let url = defaults.stringForKey("gymID")
        startConnection(url!)

    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func startConnection(urlPathString : String){
        let url : NSURL = NSURL(string: urlPathString)!
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
       // println(jsonResult)
        let values = jsonResult["gyminfo"]! as! [[String : AnyObject]]
        for value in values {
//          //  let address = value["gym_address"] as! String
//            let name = value["gym_name"] as! String
//          //  let phone = value["gym_phone"] as! String
//            let descrip = value["gym_description"] as! String
//          //  let website = value["gym_website"] as! String
            if defaults.stringForKey("gymName") == "melrose" {
                let url1 = NSURL(string: "http://www.improvingfit.com/groupfitness/uploads/gym526-1jpg")
                let data1 = NSData(contentsOfURL: url1!)
                imageGym.image = UIImage(data: data1!)
                let name = value["gym_name"] as! String
                //  let phone = value["gym_phone"] as! String
                let descrip = value["gym_description"] as! String
                if title == "" {
                    titleLabel.text = "No Title Listed"
                }
                else {
                    titleLabel.text = name
                }
                
                if descrip == "" {
                    descriptionLabel.text = "No Description Listed"
                }
                else {
                    descriptionLabel.text = descrip
                }
            }
           else if defaults.stringForKey("gymName") == "lynn" {
               // let url1 = NSURL(string: "http://www.improvingfit.com/groupfitness/uploads/gym526-1jpg")
             //   let data1 = NSData(contentsOfURL: url1!)
                imageGym.image = UIImage(named: "exercise-with-dumbbells-symbol-hi.png")
                let name = value["gym_name"] as! String
                //  let phone = value["gym_phone"] as! String
                let descrip = value["gym_description"] as! String
                if title == "" {
                    titleLabel.text = "No Title Listed"
                }
                else {
                    titleLabel.text = name
                }
                
                if descrip == "" {
                    descriptionLabel.text = "No Description Listed"
                }
                else {
                    descriptionLabel.text = descrip
                }
            }
           else  if defaults.stringForKey("gymName") == "saugus" {
                let url1 = NSURL(string: "http://www.improvingfit.com/groupfitness/uploads/gym579-1.jpg")
                let data1 = NSData(contentsOfURL: url1!)
                imageGym.image = UIImage(data: data1!)
                let name = value["gym_name"] as! String
                //  let phone = value["gym_phone"] as! String
                let descrip = value["gym_description"] as! String
                if title == "" {
                    titleLabel.text = "No Title Listed"
                }
                else {
                    titleLabel.text = name
                }
                
                if descrip == "" {
                    descriptionLabel.text = "No Description Listed"
                }
                else {
                    descriptionLabel.text = descrip
                }
            }
           else  if defaults.stringForKey("gymName") == "torigian" {
                let url1 = NSURL(string: "http://www.improvingfit.com/groupfitness/uploads/gymlogo580.jpg")
                let data1 = NSData(contentsOfURL: url1!)
                imageGym.image = UIImage(data: data1!)
                let name = value["gym_name"] as! String
                //  let phone = value["gym_phone"] as! String
                let descrip = value["gym_description"] as! String
                if title == "" {
                    titleLabel.text = "No Title Listed"
                }
                else {
                    titleLabel.text = name
                }
                
                if descrip == "" {
                    descriptionLabel.text = "No Description Listed"
                }
                else {
                    descriptionLabel.text = descrip
                }
            }
            //////
//            if title == "" {
//                titleLabel.text = "No Title Listed"
//            }
//            else {
//                titleLabel.text = name
//            }
//
//            if descrip == "" {
//                descriptionLabel.text = "No Description Listed"
//            }
//            else {
//                descriptionLabel.text = descrip
//            }

           
        }
        
    }
  
    
    
}