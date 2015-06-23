//
//  GymInfoViewController.swift
//  ImprovingFit
//
//  Created by Justin Matsnev on 6/22/15.
//  Copyright (c) 2015 ImprovingFit. All rights reserved.
//

import Foundation
import UIKit

class GymInfoViewController : UIViewController {
    
    @IBOutlet var addressLabel : UILabel!
    @IBOutlet var websiteLabel : UILabel!
    @IBOutlet var titleLabel : UILabel!
    @IBOutlet var numberLabel : UILabel!
    @IBOutlet var imageGym : UIImageView!


    var data = NSMutableData()
    
    override func viewDidLoad() {
        addressLabel.backgroundColor = UIColor.darkGrayColor().colorWithAlphaComponent(0.1)
        numberLabel.backgroundColor = UIColor.darkGrayColor().colorWithAlphaComponent(0.1)
        websiteLabel.backgroundColor = UIColor.darkGrayColor().colorWithAlphaComponent(0.1)
        super.viewDidLoad()
        startConnection()
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
            let address = value["gym_address"] as! String
            let phone = value["gym_phone"] as! String
            let website = value["gym_website"] as! String
            let name = value["gym_name"] as! String
            let url1 = NSURL(string: "http://www.improvingfit.com/groupfitness/uploads/gym526-1jpg")
            let data1 = NSData(contentsOfURL: url1!)
            imageGym.image = UIImage(data: data1!)
            if title == "" {
                titleLabel.text = "No Title Listed"
            }
            else {
                titleLabel.text = name
            }
            if address == "" {
                addressLabel.text = "No Address Listed"
            }
            else {
                addressLabel.text = address
            }
            //////
            if phone == "" {
                numberLabel.text = "No Phone Listed"
            }
            else {
            numberLabel.text = phone
            }

            if website == "" {
                websiteLabel.text = "No Website Listed"
            }
            else {
                websiteLabel.text = website
            }
            
        }
        
    }


}