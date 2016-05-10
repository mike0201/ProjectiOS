//
//  ViewController.swift
//  Ex1_chap11
//
//  Created by student5310 on 25/03/16.
//  Copyright © 2016 MB. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var value_latitude: UILabel!
    @IBOutlet weak var value_longitude: UILabel!
   
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        
        
        let currentStatus = CLLocationManager.authorizationStatus()
        
        switch currentStatus {
        case .Denied:
            print("permission denied")
        case .NotDetermined:
            locationManager.requestWhenInUseAuthorization()
            break
        case .AuthorizedWhenInUse:
            requestUserPosition()
            break
        case .AuthorizedAlways:
            requestUserPosition()
            break
        default:
            break
        }
        
    
    }
    func requestUserPosition(){
        locationManager.startUpdatingLocation()
    }
    
    
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
       
        print("numbers of location : \(locations.count)")
        for location in locations {
            let coordinate = location.coordinate
            print(coordinate.latitude)
            print(coordinate.longitude)
            value_latitude.text = String.init(format: "%.4f", coordinate.latitude)
            value_longitude.text = String.init(format: "%.4f", coordinate.longitude)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

