//
//  ViewController.swift
//  ImprovingFit
//
//  Created by Justin Matsnev on 4/2/15.
//  Copyright (c) 2015 ImprovingFit. All rights reserved.
//

import UIKit
import QuartzCore
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mapView.showsUserLocation = true
        self.mapView.delegate = self;
        self.mapView.setUserTrackingMode(MKUserTrackingMode.Follow, animated: true);
        // Do any additional setup after loading the view, typically from a nib.
    }

    


}
