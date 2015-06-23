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
    
    override func viewDidLoad() {
        
        var color : UIColor = UIColor.blackColor()
        super.viewDidLoad()
        descriptionLabel.backgroundColor = UIColor.darkGrayColor().colorWithAlphaComponent(0.1)
//        label.layer.borderWidth = 3.0
//        label.layer.borderColor = color.CGColor
//        label.layer.cornerRadius = 10.0
//        self.label.clipsToBounds = true
//        image.layer.borderColor = color.CGColor
     
      //  let dict : Dictionary = ["gym_name" : "ImprovingFit"]
      //  let appName = json["gyminfo"]["gym_name"][0].string
      //  println("\(appName)")
        startConnection()
     //   self.label.text = dict["gym_name"]
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func startConnection(){
        let urlPath = "http://www.improvingfit.com/json/gymjson.php?gym=526"
        let url : NSURL = NSURL(string: urlPath)!
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
        println(jsonResult)
        let values = jsonResult["gyminfo"]! as! [[String : AnyObject]]
        for value in values {
          //  let address = value["gym_address"] as! String
            let name = value["gym_name"] as! String
          //  let phone = value["gym_phone"] as! String
            let descrip = value["gym_description"] as! String
          //  let website = value["gym_website"] as! String
            let url1 = NSURL(string: "http://www.improvingfit.com/groupfitness/uploads/gym526-1jpg")
            let data1 = NSData(contentsOfURL: url1!)
            imageGym.image = UIImage(data: data1!)
            //////
            if title == "" {
                titleLabel.text = "No Title Listed"
            }
            else {
                titleLabel.text = name
            }
            //////
//            if address == "" {
//                addressLabel.text = "No Address Listed"
//            }
//            else {
//                addressLabel.text = address
//            }
//            //////
//            if phone == "" {
//                numberLabel.text = "No Phone Listed"
//            }
//            else {
//            numberLabel.text = phone
//            }
            //////
            if descrip == "" {
                descriptionLabel.text = "No Description Listed"
            }
            else {
                descriptionLabel.text = descrip
            }
//            //////
//            if website == "" {
//                websiteLabel.text = "No Website Listed"
//            }
//            else {
//                websiteLabel.text = website
//            }
//            //////
           
        }
        
    }
  
    
    
}