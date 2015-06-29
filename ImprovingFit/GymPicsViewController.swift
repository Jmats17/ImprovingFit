//
//  GymPicsViewController.swift
//  ImprovingFit
//
//  Created by Justin Matsnev on 6/22/15.
//  Copyright (c) 2015 ImprovingFit. All rights reserved.
//

import Foundation
import UIKit

class GymPicsViewController : UIViewController {
    
    @IBOutlet var img1 : UIImageView!
    @IBOutlet var img2 : UIImageView!
    @IBOutlet var img3 : UIImageView!
    @IBOutlet var img4 : UIImageView!
    @IBOutlet var zoomedImg : UIImageView!
    @IBOutlet var img1Button : UIButton!
    @IBOutlet var img2Button : UIButton!
    @IBOutlet var img3Button : UIButton!
    @IBOutlet var img4Button : UIButton!
    var data = NSMutableData()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        imgDetails(img1)
        imgDetails(img2)
        imgDetails(img3)
        imgDetails(img4)
        zoomedImg.hidden = true
        startConnection("http://www.improvingfit.com/json/gympicsjson.php?gym=570")
//        let url = NSURL(string: "http://www.improvingfit.com/groupfitness/uploads/gym28-4.jpg")
//        let data = NSData(contentsOfURL: url!)
//        img1.image = UIImage(data: data!)
//        
//        
//        let url1 = NSURL(string: "http://www.improvingfit.com/groupfitness/uploads/gym570-2.jpg")
//        let data1 = NSData(contentsOfURL: url1!)
//        img2.image = UIImage(data: data1!)
//        
//        let url2 = NSURL(string: "http://www.improvingfit.com/groupfitness/uploads/gym570-3.png")
//        let data2 = NSData(contentsOfURL: url2!)
//        img3.image = UIImage(data: data2!)
//        
//        let url3 = NSURL(string: "http://www.improvingfit.com/groupfitness/uploads/gym28-3.jpg")
//        let data3 = NSData(contentsOfURL: url3!)
//        img4.image = UIImage(data: data3!)
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
        println(jsonResult)
         let values = jsonResult["gympics"]! as! [[String : AnyObject]]
        for value in values {

//            let url1 = NSURL(string: "http://www.improvingfit.com/json/gympicsjson.php?gym=570")
//            let data1 = NSData(contentsOfURL: url1!)
//            imageGym.image = UIImage(data: data1!)
            
//            let pic  = value["2"] as! String
//            let decodedData = NSData(base64EncodedString: pic , options: NSDataBase64DecodingOptions(rawValue: 0))
//            var decodedimage = UIImage(data: decodedData!)
//            img1.image = decodedimage 
//            println(pic)

        }
        
    }
    
    
    @IBAction func img1Button(sender : AnyObject) {
        zoomedImg.image = img1.image
        img1.hidden = true
        img2.hidden = true
        img3.hidden = true
        img4.hidden = true
        img1Button.enabled = false
        img2Button.enabled = false
        img3Button.enabled = false
        img4Button.enabled = false
        zoomedImg.hidden = false
        zoomedImg.alpha = 1

    }
    @IBAction func img2Button(sender : AnyObject) {
        zoomedImg.image = img2.image
        img1.hidden = true
        img2.hidden = true
        img3.hidden = true
        img4.hidden = true
        img1Button.enabled = false
        img2Button.enabled = false
        img3Button.enabled = false
        img4Button.enabled = false
        zoomedImg.hidden = false
        zoomedImg.alpha = 1
        
    }
    @IBAction func img3Button(sender : AnyObject) {
        zoomedImg.image = img3.image
        img1.hidden = true
        img2.hidden = true
        img3.hidden = true
        img4.hidden = true
        img1Button.enabled = false
        img2Button.enabled = false
        img3Button.enabled = false
        img4Button.enabled = false
        zoomedImg.hidden = false
        zoomedImg.alpha = 1
        
    }
    @IBAction func img4Button(sender : AnyObject) {
        zoomedImg.image = img4.image
        img1.hidden = true
        img2.hidden = true
        img3.hidden = true
        img4.hidden = true
        img1Button.enabled = false
        img2Button.enabled = false
        img3Button.enabled = false
        img4Button.enabled = false
        zoomedImg.hidden = false
        zoomedImg.alpha = 1
        
    }
    
   @IBAction func tappedOutsidePic(sender : AnyObject) {
        
        img1.hidden = false
        img2.hidden = false
        img3.hidden = false
        img4.hidden = false
        img1Button.enabled = true
        img2Button.enabled = true
        img3Button.enabled = true
        img4Button.enabled = true
        zoomedImg.hidden = true
        zoomedImg.alpha = 0

    }
    

    func imgDetails(image : UIImageView) {
        image.layer.borderWidth = 2.0
        image.layer.borderColor = UIColor.blackColor().CGColor
        image.layer.cornerRadius = 4.0
    }
    
    

}