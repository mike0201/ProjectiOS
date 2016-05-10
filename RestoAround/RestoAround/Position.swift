//
//  Position.swift
//  RestoAround
//
//  Created by student5310 on 19/04/16.
//  Copyright © 2016 MB. All rights reserved.
//

import UIKit
import CoreLocation

class Position: NSObject,CLLocationManagerDelegate {
    
    let positionManager = CLLocationManager()
    
    typealias getPosition = (position:[String]) -> Void
    
    var callBack : getPosition?
    
    override init() {
        super.init()
        self.positionManager.delegate = self
        
    }
    
    func getLocation(callBack:getPosition){
        self.callBack = callBack
        
        let current_position = CLLocationManager.authorizationStatus()
        
        switch current_position {
        case .AuthorizedAlways:
            requestUserPosition()
            break
        case .AuthorizedWhenInUse:
            requestUserPosition()
            break
        case .Denied:
            print("Autorisation Denied")
            break
        case .NotDetermined:
            positionManager.requestWhenInUseAuthorization()
            break
        default:
            break
            
        }
    }
    

    func requestUserPosition(){
        positionManager.startUpdatingLocation()
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        positionManager.stopUpdatingLocation()
        if let call = callBack{
            
            var position = [String]()
            
            for location in locations{
                
                let coordinate = location.coordinate
                position.append(String(coordinate.latitude))
                position.append(String(coordinate.longitude))
                
            }
            call(position: position)
            
        }
        callBack = nil
    }
    
}
