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

    var data = NSMutableData()

    override func viewDidLoad() {
        super.viewDidLoad()
        myGymButton.layer.borderWidth = 1.0
        myGymButton.layer.borderColor = UIColor.blackColor().CGColor
        myGymButton.layer.cornerRadius = 2.0
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
           
            let url = NSURL(string: "http://www.improvingfit.com/groupfitness/uploads/gymlogo526.jpg")
            let data = NSData(contentsOfURL: url!)
            logoImage.image = UIImage(data: data!)
          
          
            // image.image = imageFromDict
        }
        //let name = jsonResult["gym_address"]?.string
        // println("\(name)")
    }
}

